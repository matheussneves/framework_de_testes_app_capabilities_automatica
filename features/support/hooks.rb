Before do |_scenario|
  # TODO: TEMPORARIO
  @app = (ENV.fetch('PLATFORM', nil) == 'android' ? 'hands.android.webmotors.debug' : 'br.com.webmotors.dev')
  if ios?
    execute_script('mobile: installApp', {'app': PATH_APP}) unless execute_script('mobile: isAppInstalled', 'bundleId': @app)
    execute_script('mobile: launchApp', {'bundleId':  @app})
    wait_for_until(20) {driver.execute_script('mobile: alert', {'action': 'getButtons'})}
    execute_script('mobile: alert', {'action': 'accept', 'buttonLabel': (driver.execute_script('mobile: alert', {'action': 'getButtons'})[1])})
    home.iconechat.esperar(6)
  else
    execute_script('mobile: installApp', {'appPath': PATH_APP}) unless execute_script('mobile: isAppInstalled', 'appId': @app)
    execute_script('mobile: activateApp', {'appId':  @app})
    execute_script('mobile: getPermissions', {'type':  'denied', 'appPackage':  @app}).each { |per|  execute_script('mobile: changePermissions', {'permissions':  per, 'appPackage':  @app, 'action':  'grant'}) }
    unless home.iconechat.esperar(10).visivel?
      login.btnEntendi.esperar(10).clicar unless home.iconeMenu.visivel?
      login.btnfechado.clicar(10) unless home.iconeMenu.visivel?
    end
  end
end

After do |_scenario|
  time = Time.new
  $sufixo = ('falha' if _scenario.failed?) || 'sucesso'
  $name = _scenario.name.tr(' ', '_').downcase
  foto = "relatorios/screenshot/#{$sufixo}_#{$name}_#{time.day}-#{time.month}-#{time.year}-#{time.hour}-#{time.min}.png"
  screenshot(foto)
  Allure.add_attachment(
    name: 'filename',
    source: File.open("#{foto}"), 
    type: Allure::ContentType::PNG,
    test_case: true
  )
  #base64_img = Base64.encode64(File.open(foto, 'rb:UTF-8', &:read))
  #attach(base64_img, 'image/png;base64')
  #Allure.add_attachment(name: foto, source: File.open(foto), type: Allure::ContentType::PNG, test_case: true)
end

After do |scenario|
  if ios?
    execute_script('mobile: removeApp', {'bundleId': @app}) if execute_script('mobile: isAppInstalled', 'bundleId': @app)
  else
    execute_script('mobile: removeApp', {'appId': @app })  if execute_script('mobile: isAppInstalled', 'appId': @app)
  end
end

at_exit do
  if ios?
    execute_script('mobile: removeApp', {'bundleId': @app}) if execute_script('mobile: isAppInstalled', 'bundleId': @app)
  else
    execute_script('mobile: removeApp', {'appId': @app })  if execute_script('mobile: isAppInstalled', 'appId': @app)
  end
  close_appium_session
  time = Time.now.to_s
  ReportBuilder.configure do |config|
    config.json_path = 'relatorios/report.json'
    config.report_path = 'relatorios/cucumber_relatorio'
    config.report_types = [:html]
    config.report_title = 'Relatório de Testes automatizados'
    config.compress_images = false
    config.color = 'red'
    config.additional_info = {'Project name' => 'teste', 'Platform' => 'Front',
                               'Report generated' => time}
  end
  ReportBuilder.build_report
rescue StandardError
  nil
end

BeforeAll do
  start_appium_session
end