  def elemento(elemento, type)
      {'elemento' => elemento.to_s, 'type' => type.to_s} 
  end

class String
  def type_id
    elemento(self, "id")
  end

  def type_text
    elemento(self, "text")
  end

  def type_class
    elemento(self, "class")
  end
  
  def type_xpath
    elemento(self, "xpath")
  end

  def type_accessibility_id
    elemento(self, "accessibility_id")
  end
end

class Hash
  def buscar
    begin
      self['type'].eql?('text') ? find_element(:xpath, '//*[contains('+ (android? ? '@text' : '@value')+','+"'"+self['elemento']+"'"+')]') : find_element(":#{self['type']}".parameterize, self['elemento'])
    rescue
      false
    end
  end
  

  def buscar_elementos
    begin
      hash_elementos = []
      (self['type'].eql?('text') ? find_elements(:xpath, '//*[contains('+ (android? ? '@text' : '@value')+','+"'"+self['elemento']+"'"+')]') : find_elements(":#{self['type']}".parameterize, self['elemento'])).each { |ele| hash_elementos.push({'encontrado' => ele}) } 
      return hash_elementos
    rescue
      false
    end
  end

  def esperar(time = TIME_COMMAND)
    @ele = false
    wait_for_until(time) { @ele = self.buscar }
    self['encontrado'] = @ele unless @ele.eql?(false)
    self
  rescue
    puts "Elemento #{self} não encontrado"
  end

  def esperar_elemento_visivel(time = TIME_COMMAND)
    @ele = false
    wait_for_until(time) { self.visivel? }
    @ele = self.buscar
    self['encontrado'] = @ele unless @ele.eql?(false)
    self
  rescue
    puts "Elemento #{self} não encontrado"
  end

  def esperar_elemento_ativo(time = TIME_COMMAND)
    @ele = false
    wait_for_until(time) { self.ativo? }
    @ele = self.buscar
    self['encontrado'] = @ele unless @ele.eql?(false)
    self
  rescue
    puts "Elemento #{self} não encontrado"
  end

  def texto
    self.key?('encontrado') ? self['encontrado'].text : self.buscar.text
  rescue
    false
  end

  def visivel?
    self.key?('encontrado') ? self['encontrado'].displayed? : self.buscar.displayed?
  rescue
    false
  end

  def ativo?
    self.key?('encontrado') ? self['encontrado'].enabled? : self.buscar.enabled?
  rescue
    false
  end

  def clicar(time = TIME_COMMAND)
    self.esperar(time / 3) unless self.key?('encontrado')
    wait_for_until(time / 3) { self.visivel?}
    wait_for_until(time / 3) { self.ativo?}
    self.toque(time)
  rescue
    puts "Erro ao clicar no elemento #{self}"
    false
  end

  def toque(time = TIME_COMMAND)
    self.esperar(time) unless self.key?('encontrado')
    toque_cord(get_tap_cord(self['encontrado']))
    self
  rescue
    puts "Erro ao tocar no elemento #{self}"
    false
  end
  
  def digitar(text, clear = false, close = true )
    self.esperar(1) unless self.key?('encontrado')
    wait_for_until(1) { self.ativo?}
    self['encontrado'].clear if clear || self.eql?(false)
    self['encontrado'].send_keys(text.to_s) unless self['encontrado'].eql?(false)
    close_keyboard if keyboard_is_present and close
    self
  end
  
  
  def scroll(time = TIME_COMMAND, direction='down' )
    wait_for_until(time) do 
      ele = self.visivel?
      (android? ? execute_script('mobile: scrollGesture', {'left': (window_size.width / 100) * 4, 'top': (window_size.height / 100) * 4, 'width': (window_size.width / 100) * 87   , 'height': (window_size.height / 100) * 55 , 'direction': direction, 'percent': 1, 'speed': 10000 }) : execute_script('mobile: swipe', {'direction': (direction.eql?('up') ? 'down' : 'up')}) == false ) unless ele
      ele
    end
    self.esperar unless self.key?('encontrado')
    self
  rescue
    puts "Erro ao rolar para o elemento #{self}"
  end
  
  def swipe_lateral(vezes=1, sense='right')
    self['elemento'].class.eql?(Hash) ? elemento = self['encontrado'] : elemento = self.buscar
    my_y = elemento.location.y + 100
    my_x = elemento.location.x 
    my_width = window_size.width  * 0.90
    my_height = elemento.size.height - 20
    vezes.times do 
        android? ? execute_script('mobile: scrollGesture', {'left': my_x, 'top': my_y, 'width': my_width , 'height': my_height , 'direction': sense, 'percent': 1.0}) : execute_script('mobile: dragFromToForDuration', {'fromX': my_width , 'fromY': my_y, 'toX': my_width / 10 , 'toY': my_y , 'duration': 0.1})
    end 
  end
end

