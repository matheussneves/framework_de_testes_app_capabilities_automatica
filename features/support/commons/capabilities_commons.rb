def load_local_devices(type)
  type = 'virtual' if type.eql?(nil)
  puts 'LOADING LOCAL DEVICES'
  devices = []
  `adb start-server` if android?
  list_local_devices(devices,type)
  puts "DEVICES FOUND"
  puts devices
  initialize_local_devices(devices) if type.eql?('vir tual')
  devices
rescue StandardError => e
  raise puts 'ERROR LOADING LOCAL DEVICES', e
end


def list_local_devices(devices, args)
  devices = send("list_#{PLATFORM.downcase}_devices", devices, args)
  raise 'NO CONNECTED DEVICES FOUND!' if devices.empty?
  devices
end

def initialize_local_devices(devices)
  if PLATFORM.eql?('android')
    avd = Thread.new { `~/Library/Android/sdk/emulator/emulator -avd #{devices[1].split(':::')[0]} -netdelay none -netspeed full` }
    sleep 20
  else
  `xcrun simctl boot #{devices.first.split(':::')[1]}` 
  end
end

def list_android_devices(devices, args)
  if args.eql?('virtual')
    android_virtual_devices = `~/Library/Android/sdk/emulator/emulator -list-avds`
    raise 'NO VIRTUAL DEVICES FOUND, MAKE SURE YOU HAVE SOME VIRTUAL DEVICE CREATED!' if android_virtual_devices.empty?

    android_virtual_devices.split("\n").each_with_index { |device, index| devices << "#{device}:::emulator-#{%w[5554 5556 5558 5560 5562][index]}:::android:::local" }
  else
    android_real_devices = `~/Library/Android/sdk/platform-tools/adb devices -l`.split("\n").drop(1)
    raise 'NO REAL DEVICES FOUND, MAKE SURE THE DEVICE IS CONNECTED AND AVAILABLE AND TRY AGAIN!' if android_real_devices.empty?

    android_real_devices.each { |real_device| devices << "#{real_device.split[2]}:::#{real_device.split.first}:::android:::local" }
  end
  devices
end

def list_ios_devices(devices, args)
  if args.eql?('virtual')
    list_ios_local_simulators(devices)
  else
    local_real_devices = `idevice_id -l`&.split("\n")
    raise 'NO REAL DEVICES FOUND, MAKE SURE THE DEVICE IS CONNECTED AND AVAILABLE AND TRY AGAIN!' if local_real_devices.nil? || local_real_devices.empty?

    local_real_devices.each_with_index { |device, index| devices << "iPhone #{index}:::#{device}:::ios:::local" }
  end
  devices
end

def list_ios_local_simulators(devices)
 `xcrun simctl delete unavailable`
  local_booted_devices = list_iphones_by_state('Booted')
  local_booted_devices.each { |device_info| devices << "#{device_info['name']}:::#{device_info['udid']}:::ios:::local" }

  local_devices_off = list_iphones_by_state('Shutdown')
  local_devices_off.each { |device_info| devices << "#{device_info['name']}:::#{device_info['udid']}:::ios:::local" }
  devices
end

def list_iphones_by_state(state = nil)
  local_devices = []
  JSON.parse(`xcrun simctl list --json`)['devices'].each_value { |x| local_devices += x unless x.empty? }
  local_devices = local_devices.select { |local_device| local_device['name'].include?('iPhone') }
  return local_devices unless state
  local_devices.select { |local_device| local_device['state'].eql?(state) }
end



def load_appium_capabilities
  opts = { caps: {}, appium_lib: {} }
  load_commons_capabilities(opts)
  # call dinamically load_ios_capabilities or load_android_capabilities
  send("load_#{PLATFORM.downcase}_capabilities", opts)
  send("load_local_capabilities", opts)
  puts 'CAPABILITIES LOADED', opts
  opts
end

def load_commons_capabilities(opts)
  opts[:caps][:platformName] = PLATFORM
  opts[:appium_lib][:server_url] = APP_CONFIG_DATA['caps'][TEST_LOCATION]['url']
end

def load_ios_capabilities(opts)
  if TYPE_DEVICE.eql?('virtual')
    opts[:caps][:updatedWDABundleId] = 'com.selfcare.Development'
    opts[:caps][:derivedDataPath] = 'config/app/WebDriverAgent'
  end
  opts[:caps][:autoAcceptAlerts] = false
  opts[:caps][:language] = "pt"
  opts[:caps][:locale] = "pt_BR"
  opts[:caps][:useNewWDA] = false
end

def load_android_capabilities(opts)
  opts[:caps][:autoGrantPermissions] = true
  opts[:caps][:autoAcceptAlerts] = true
  opts[:caps][:ensureWebviewsHavePages] = true
  opts[:caps][:connectHardwareKeyboard] = true
end

def load_local_capabilities(opts)
  opts[:caps][:newCommandTimeout] = 999999
  opts[:caps][:fullReset] = false
  opts[:caps][:deviceName] = DEVICE_NAME
  opts[:caps][:udid] =  DEVICE_ID
  opts[:caps][:app] = PATH_APP
  opts[:caps][:systemPort] = 8200 if PLATFORM.eql?('android')
  opts[:caps][:wdaLocalPort] = 8100 if PLATFORM.eql?('ios')
  opts[:caps][:automationName] = APP_CONFIG_DATA['caps'][TEST_LOCATION]['automationName'][PLATFORM]
end

def action_alert
while ALERT.eql?(true) do
  alert_dismiss if DISMISS.eql?(true)
  alert_accept if ACCEPT.eql?(true)
end
end

def start_appium_session
  execute_with_retry { start_driver }
  sleep 2
  puts 'APPIUM SESSION STARTED'
rescue StandardError => e
  raise puts "ERROR STARTING CONNECTION WITH APPIUM!\nERROR CLASS: #{e.class}\nERROR MESSAGE: #{e}\nDRIVER: #{$driver.pretty_inspect}\nBACKTRACE: #{e.backtrace.pretty_inspect}\n"
end

def close_appium_session
  driver_quit
  puts 'APPIUM SESSION FINISHED'
rescue StandardError => e
  raise puts "ERROR CLOSING CONNECTION WITH APPIUM!\nERROR CLASS: #{e.class}\nERROR MESSAGE: #{e}\nDRIVER: #{$driver.pretty_inspect}\nBACKTRACE: #{e.backtrace.pretty_inspect}\n"
end

def execute_with_retry(retries = 50)
  yield
rescue StandardError => e
  puts "RETRYING #{retries}...#{e.message}"
  sleep 2
  retries -= 1
  if retries.eql?(0) && e.message.eql?('A session is either terminated or not started')
    start_driver
    sleep 2
    logger 'SESSION STARTED'
    retry
  end
  raise e unless retries.positive?

  retry
end