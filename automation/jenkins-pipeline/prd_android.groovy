#!/usr/bin/env groovy

String var_workspace, var_branch, var_folder, var_git_commit
node('Slave-IOS-Android') {
    try {

        stage('Setting vars') {
            var_workspace = pwd()
            // Code config
            var_repo = "git@bitbucket.org:webmotors/mobile-android-cockpit.git"
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

        stage('Clean enviroment') {
            sh "rm -Rf ${var_folder}"
        }

        stage('Setup deploy') {
            dir(var_folder) {
                checkout scm
                sh """
			        bundle install
			        appium --base-path=/wd/hub --port 4723 &
			    """
            }
        }

        stage('Download APK') {
            dir(var_folder) {
               //curl -H'Authorization: Bearer ${var_jfrog_token}' -O https://jfrog.wmaws.com.br/artifactory/Aplicativos/Android/webmotors-pf/app-hk-release.apk

               withCredentials([usernamePassword(credentialsId: 'jfrog', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh """
                    echo ${var_jfrog_token}
                    mkdir -p config/app/android
                    cd config/app/android
                    curl '-u $USERNAME:$PASSWORD' -O https://jfrog.wmaws.com.br/artifactory/Aplicativos/Android/webmotors-pf/app-hk-release.apk

                    cd ../../..
                """
                }
            }
        }

        stage('Setup Android Emulator') {
            sh """
					cd ${var_folder}
					nohup ~/Library/Android/sdk/emulator/emulator @Pixel_3_API_33 -no-snapshot-save -port 5554 &
				"""
        }

        stage('Run Tests') {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
//                var_tag = "-t @critico"
//                sh "PARAMS: ${params.tag}"
//                if (params.tag != null) {
//                    var_tag = params.tag
//                }
                sh """
					cd ${var_folder}
					ls

					cucumber -p android -p virtual -t 'not @ignorarAndroid'       
				"""
            }
        }

        stage('Report') {
            script {
                allure([
                        includeProperties: false,
                        jdk              : '',
                        properties       : [],
                        reportBuildPolicy: 'ALWAYS',
                        results          : [[path: 'webmotors-pf-teste/allure-results']]
                ])
            }
        }

        stage('Quality Gate') {
            script {
                def result = readJSON file: "${var_workspace}/allure-report/history/history-trend.json"
                def failed = result.data.failed[0]
                def broken = result.data.broken[0]
                def skipped = result.data.skipped[0]
                def passed = result.data.passed[0]
                def totalTests = result.data.total[0]
                def totalFailed = failed + broken
                def calc = passed * 100 / totalTests
                sh """
                echo failed: ${failed}
                echo broken: ${broken}
                echo skipped: ${skipped}
                echo passed: ${passed}
                echo totalTests: ${totalTests}
                echo calc: ${calc}

				"""
                calc = (int) calc
                common.Calc(calc, totalTests, passed, totalFailed)
            }
        }

    } catch (e) {
        currentBuild.result = "FAILURE"
        throw e
    } finally {
      stage ('Finish Job') {
           sh """
        
            kill -9 \$(lsof -ti:4723)
             adb kill-server
            """
       }
    }
}