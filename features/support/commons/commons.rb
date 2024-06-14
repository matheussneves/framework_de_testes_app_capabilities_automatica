def existe(ele)
  exists(pre_check = 0, post_check = 1) { ele }
end

def wait_for_until(time, &block)
  Selenium::WebDriver.logger.level = :error
  Selenium::WebDriver::Wait.new(timeout: time).until { block.call }
rescue Selenium::WebDriver::Error::TimeoutError => e
  false
end

def scroll_mobile_command(element)
  execute_script('mobile: scroll', { 'direction' => 'down' }, { 'element' => element }, { 'toVisible' => true })
rescue StandardError => e
  raise "Scrolling error #{e}"
end

def scroll_por_elemento(elemento, time = 50, sense='down' )
  ele = false
  wait_for_until(time) { ( ele = elemento.buscar) ? ele :  (android? ? execute_script('mobile: scrollGesture', {'left': (window_size.width / 100) * 4, 'top': (window_size.height / 100) * 4, 'width': (window_size.width / 100) * 87   , 'height': (window_size.height / 100) * 70 , 'direction': sense, 'percent': 1, 'speed': 10000 }) : execute_script('mobile: scroll', {'direction': sense})) == false }
end

def swipe_lateral_por_elemento(elemento_base, elemento_final, time = 40, sense='right'  )
  elem = elemento_base.esperar(20)['encontrado']
  my_y = elem.location.y
  my_x = elem.location.x 
  my_width = elem.size.width - ( elem.size.width / 95)
  my_height = elem.size.height
  ele = false
  wait_for_until(time) { (ele = elemento_final.visivel?) ? ele : (android? ? execute_script('mobile: scrollGesture', {'left': my_x, 'top': my_y, 'width': my_width , 'height': my_height , 'direction': sense, 'percent': 1.0}) : execute_script('mobile: dragFromToForDuration', {'fromX': my_width , 'fromY':  my_y, 'toX': my_x , 'toY': my_y , 'duration': 0.1})) == false  } unless elemento_final.visivel?
  elemento_final.esperar(1)
end

def swipe_lateral(elemento_base, vezes=1, sense='right')
  elemento = elemento_base.buscar
  my_y = elemento.location.y + 100
  my_x = elemento.location.x 
  my_width = elemento.size.width - 400
  my_height = elemento.size.height - 20
  vezes.times do 
      android? ? execute_script('mobile: scrollGesture', {'left': my_x, 'top': my_y, 'width': my_width , 'height': my_height , 'direction': sense, 'percent': 1.0}) : execute_script('mobile: dragFromToForDuration', {'fromX': my_width , 'fromY': my_y, 'toX': my_width / 10 , 'toY': my_y , 'duration': 0.1})
  end 
end

def android?
  ENV.fetch('PLATFORM', nil) == 'android'
end

def ios?
  ENV.fetch('PLATFORM', nil) == 'ios'
end

def real?
  TYPE_DEVICE.downcase.eql?('real')
end

def virtual?
  TYPE_DEVICE.downcase.eql?('virtual')
end

def keyboard_is_present
  $driver.execute_script("mobile: isKeyboardShown")
end

def close_keyboard
  if keyboard_is_present
    if android?
      execute_script("mobile: hideKeyboard")
    else
      keycode = %w[retorno Return return Concluído concluído Done done next Next OK ok Fechar fechar close Close ]
      keycode.each { |x| break find_element(:id, x).click if exists(pre_check = 0, post_check = 1) { find_element(:id, x) } }
    end
  end
rescue Selenium::WebDriver::Error::UnknownError
 nil
end

def get_tap_cord(ele)
  x = ele.location.x + (ele.size.width / 2)
  y = ele.location.y + (ele.size.height / 2)
  return [x, y]
end

def toque_cord(cord)
  android? ? execute_script('mobile: clickGesture', {'x': cord[0], 'y': cord[1]}) : execute_script('mobile: tap', {'x': cord[0], 'y': cord[1]})
end

def press_keycode_ios(keycode)
  exists(pre_check = 0, post_check = 1) { find_elements(:class, 'XCUIElementTypeButton').each { |keys| keys.click if keys.text == keycode } }
rescue Selenium::WebDriver::Error::UnknownError
  LOGGER.error('keyboard não está visivel! press_kaycode')
end

def press_by_keycode(keycode_ios, keycode_android)
  txt_botao = page_lista_text.to_s.include?(keycode_ios) ? 'retorno' : 'return'
  ios? ? press_keycode_ios(txt_botao) : $driver.press_keycode(keycode_android)
  puts("Fechou o teclado virtual precionando o botão #{txt_botao}")
end

def swipe_to(y_size = 0.25, direction = 'down')
  x = window_size[:width] / 2
  y = window_size[:height] * y_size
  end_y = direction.eql?('down') ? 0 : window_size[:height] - 50

  start_cords = [x, y]

  Appium::TouchAction.new.swipe(start_x: start_cords[0], start_y: start_cords[1], end_x: start_cords[0], end_y: end_y, duration: 1000).perform
  puts("Executou o scroll swipe para as coordenadas: start_x #{start_cords[0]} - start_y #{start_cords[1]} - screen_x_end #{start_cords[0]} - screen_y_end #{end_y}")
end

def fechar_popup(tempo = 2)
  btnpopup = ['Entendi']
  btnpopup.each { |x| x.type_text.clicar(tempo) }
end

def page_text
  Appium.update_settings(snapshotTimeout: 50) if device_is_ios?
  (android? ? get_android_inspect.split('text: ').map(&:strip).to_s : get_source).to_s
end


  def swipe_baixo_android
    coord = {start_x: 0.50, start_y: 0.69, end_x: 0.50, end_y: 0.24, duration: 2000}
    Appium::TouchAction.new.swipe(coord).perform
  end
  
  def tap_by_coord(x, y)
    android? ? execute_script('mobile: clickGesture', {'x': x, 'y': y}) : execute_script('mobile: tap', {'x': x, 'y': y})
  end