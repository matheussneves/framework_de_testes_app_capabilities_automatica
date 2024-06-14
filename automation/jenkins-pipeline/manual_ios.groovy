#!/usr/bin/env groovy

String var_workspace, var_branch, var_folder, var_git_commit
node ('MacMiniM1') {
  try {

    stage ('Setting vars') {
      var_workspace = pwd()
      // Code config
      var_branch = "master"
      var_folder = "webmotors-pf-teste"
      var_jfrog_token = sh(
    			script: 'echo $JFROG_TOKEN',
    			returnStdout: true
			).trim()
    }

    stage('Load Libs') {
        git branch: 'main',
                credentialsId: 'github',
                url: 'git@github.com:webmotors-private/qa.libs.git'
        common = load "common.grovvy"
    }
    
    stage ('Clean enviroment') {
    	sh "rm -Rf ${var_folder}"
    }

    stage ('Setup deploy') {
      dir(var_folder){
      	  checkout scm
          sh """
              rbenv local 3.0.6
              bundle install
              appium --base-path=/wd/hub --port 4723 &
          """
      }
    }
    
    stage ('Download APP') {
      dir(var_folder){
        // curl -H'Authorization: Bearer ${var_jfrog_token}' -O 'https://jfrog.wmaws.com.br/artifactory/Aplicativos/iOS/APPPF/webmotors-pf.zip'

        withCredentials([usernamePassword(credentialsId: 'jfrog', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
           sh """
              mkdir -p config/app/ios
              cd config/app/ios
              ls
              rm -rf webmotors-pf.zip
              rm -rf Webmotors.app
              ls
              curl '-u $USERNAME:$PASSWORD' -O https://jfrog.wmaws.com.br/artifactory/Aplicativos/iOS/APPPF/webmotors-pf.zip
              unzip webmotors-pf.zip
              cd ../../..
            """
        }
      }
    }
    
    stage ('Setup iOS Emulator') {
      sh """
          cd ${var_folder}
          xcrun simctl list
          open -a simulator
        """
    }

    stage ('Run Tests') {
    //   var_tag = "-t @critico"
    //   if (params.tag != null){
    //     var_tag = params.tag
    //   }
      catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh """
              cd ${var_folder}
              ls
              cucumber -p ios -p virtual -t ${params.cenario}
          """
      }
     
    }

    stage('Report') {
      script {
          allure([
            includeProperties: false,
            jdk: '',
            properties: [],
            reportBuildPolicy: 'ALWAYS',
            results: [[path: 'webmotors-pf-teste/allure-results']]
          ])
      }
    }

    stage('Quality Gate'){
      script{
        def result = readJSON file: "${var_workspace}/allure-report/history/history-trend.json"
            def failed = result.data.failed[0]
            def broken = result.data.broken[0]
            def skipped = result.data.skipped[0]
            def passed = result.data.passed[0]
            def totalTests = result.data.total[0]
            def totalFailed = failed + broken
            def calc = passed * 100 / totalTests
            calc = (int)calc
            common.Calc(calc, totalTests, passed, totalFailed)
      }
    }

  } catch (e) {
    currentBuild.result = "FAILED"
    throw e
  } finally {
    stage ('Finish Job') {
				// try{
				// 	def now = new Date()
				// 	def formatNow = now.format("yyyy-MM-dd/HH-mm", TimeZone.getTimeZone('UTC'))
				// 	int year = now.getYear() + 1900
				// 	sh """
				// 		echo ${now}
				// 		echo ${formatNow}
				// 		cd ${var_workspace}
				// 		cd ${var_folder}
				// 		cd relatorios
				// 		curl -H'Authorization: Bearer ${var_jfrog_token}' -X PUT http://jfrog.wmaws.com.br/artifactory/Automacao/APPPF/iOS/${year}/${formatNow}/report.html --upload-file cucumber_relatorio.html
				// 	"""
				// }catch (e){
				// }
        sh """
        
          kill -9 \$(lsof -ti:4723)

        """
    }
  }
}