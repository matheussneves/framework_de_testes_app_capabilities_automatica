def gerar_cpf(formatado = false)
  cpf = formatado ? Faker::CPF.pretty : Faker::CPF.number
  puts "CPF: #{cpf}"
  cpf
end

def gerar_numero(numero)
  Faker::Number.number(digits: numero)
end

def gerar_complemento(caracteres = 20)
  Faker::Lorem.paragraph_by_chars(number: caracteres)
end

def gerar_nome
  Faker::Name.first_name
end

def gerar_sobrenome
  Faker::Name.last_name
end

def gerar_data_nascimento
  "#{rand(12..28)}0#{rand(1..9)}#{rand(1970..2000)}"
end

def gerar_nome_completo
"#{gerar_nome} #{gerar_sobrenome}"
end

def gerar_placa(veic)
  veic.downcase.eql?('carro') ? "#{Faker::Lorem.characters(number: 3, min_alpha: 3)}#{Faker::Lorem.characters(number: 1, min_numeric: 1)}#{Faker::Lorem.characters(number: 1, min_alpha: 1)}#{Faker::Lorem.characters(number: 2, min_numeric: 2)}" : "#{Faker::Lorem.characters(number: 3, min_alpha: 3)}#{Faker::Lorem.characters(number: 4, min_numeric: 4)}"
end