
=begin
Massa gerenciadas:
tdm('dados_usuario', email: "testelocation@outlook.com", senha:'Teste125!')
tdm('dados_fipe', marca: "", modelo:'', ano:2000, versao:'', estado: '' )
tdm('desfavoritar_anuncio', email: "testelocation@outlook.com", senha:'Teste125!', marca: 'CHEVROLET', modelo: 'PRISMA', versao: '1.0 MPFI LT 8V FLEX 4P MANUAL', preco: 33800.0, veiculo: 'moto' )
tdm('anuncios_favoritados', email: "testelocation@outlook.com", senha:'Teste125!', veiculo: 'moto' )
tdm('dados_do_veiculo', AnoAte: '', AnoDe: '',Blindado: '',Carroceria: '',Cor: '',FinalPlaca: '',Combustivel: '',KmAte: '',KmDe: '',Marca1: '',Modelo1: '',Portas: '',Opcionais: '',Oportunidades: '',PrecoAte: '',PrecoDe: '',tipoveiculo: '',Cambio: '',Versao1: '',estado: '',cidade: '',Anunciante: '',localizacao: '' )
=end

def tdm(massa, **kargs)
  send(massa, **kargs)
end

def dados_usuario(**kargs)
  api = carregar_massa("apis", 'acesso')
  endpoint = OpenStruct.new
  endpoint.base_url = api.base_url 
  endpoint.path = api.endpoints.dados_usuario
  endpoint.header = api.headers.to_h
  endpoint.header[:authorization] =  tokens(kargs[:email], kargs[:senha])['IdToken']
  post_api(endpoint).Retorno
end

def dados_do_veiculo(**kargs)
  api = carregar_massa("apis", 'hportal_search')
  endpoint = OpenStruct.new
  endpoint.base_url = api.base_url
  path = api.endpoints.search
  path = path + "AnoAte=#{kargs[:AnoAte]}&" unless kargs[:AnoAte].eql?(nil)
  path = path + "AnoDe=#{kargs[:AnoDe]}&"  unless kargs[:AnoDe].eql?(nil)
  path = path + "Blindado=#{kargs[:Blindado]}&" unless kargs[:Blindado].eql?(nil)
  path = path + "Carroceria=#{kargs[:Carroceria]}&" unless kargs[:Carroceria].eql?(nil)
  path = path + "Cor=#{kargs[:Cor]}&"  unless kargs[:Cor].eql?(nil)
  path = path + "FinalPlaca=#{kargs[:FinalPlaca]}&" unless kargs[:FinalPlaca].eql?(nil)
  path = path + "Combustivel=#{kargs[:Combustivel]}&"  unless kargs[:Combustivel].eql?(nil)
  path = path + "KmAte=#{kargs[:KmAte]}&"  unless kargs[:KmAte].eql?(nil)
  path = path + "KmDe=#{kargs[:KmDe]}&" unless kargs[:KmDe].eql?(nil)
  path = path + "Marca1=#{kargs[:Marca]}&" unless kargs[:Marca].eql?(nil)
  path = path + "Modelo1=#{kargs[:Modelo]}&"  unless kargs[:Modelo].eql?(nil)
  path = path + "Portas=#{kargs[:Portas]}&" unless kargs[:Portas].eql?(nil)
  path = path + "Opcionais=#{kargs[:Opcionais]}&" unless kargs[:Opcionais].eql?(nil)
  path = path + "Oportunidades=#{kargs[:Oportunidades]}&"  unless kargs[:Oportunidades].eql?(nil)
  path = path + "PrecoAte#{kargs[:PrecoAte]}&"  unless kargs[:PrecoAte].eql?(nil)
  path = path + "PrecoDe=#{kargs[:PrecoDe]}&"  unless kargs[:PrecoDe].eql?(nil)
  path = path + "tipoveiculo=#{kargs[:tipoveiculo]}&"  unless kargs[:tipoveiculo].eql?(nil)
  path = path + "Cambio=#{kargs[:Cambio]}&" unless kargs[:Cambio].eql?(nil)
  path = path + "Atributos=#{kargs[:Atributos]}&"  unless kargs[:Atributos].eql?(nil)
  path = path + "Versao1=#{kargs[:Versao]}&"  unless kargs[:Versao].eql?(nil)
  path = path + "estadocidade=#{kargs[:estado]} - #{kargs[:cidade]}&" unless (kargs[:estado].eql?(nil) and kargs[:cidade].eql?(nil)) 
  path = path + "Anunciante=#{kargs[:Anunciante]}&" unless kargs[:Anunciante].eql?(nil)
  path = path + "localizacao=#{kargs[:localizacao]}&"  unless kargs[:localizacao].eql?(nil)
  path = path + "showCount=#{true}&" # unless kargs[:showCount].eql?(nil)
  path = path + "showMenu=#{true}&" #unless kargs[:showMenu].eql?(nil)
  path = path + "showResult=#{true}"  #unless kargs[:showResult].eql?(nil)
  endpoint.path = path
  endpoint.header = api.headers.to_h
  veiculos = []
  get_api(endpoint).SearchResults.each do |veiculo|
    veiculos.push(veiculo.Specification)
  end
  return veiculos
end

def anuncio_no_status(**kargs)
  #chamada tdm('anuncio_no_status', email: "testelocation@outlook.com", senha:'Teste125!', situacaoAnuncio: 'Excluido' )
  @situacaoAnuncio = kargs[:situacaoAnuncio]
  @anuncio = nil
  api = carregar_massa("apis", 'hportal_minha_wm_carro')
  endpoint = OpenStruct.new
  endpoint.base_url = api.base_url 
  endpoint.path = api.endpoints.anuncios_carro
  endpoint.header = api.headers.to_h
  endpoint.header[:authorization] =  tokens(kargs[:email], kargs[:senha])['IdToken']
  anuncios = get_api(endpoint).Retorno
  
    case @situacaoAnuncio
    when 'Anúncio ativo'   
      anuncios_com_o_status = anuncios.select { |anuncio| anuncio.CodigoSituacao.eql?("A") or anuncio.CodigoSituacao.eql?("D") or anuncio.CodigoSituacao.eql?("P") }
      if anuncios_com_o_status.length == 0

      end
    when 'Dados incompletos'
      anuncios_com_o_status = anuncios.select { |anuncio| anuncio.CodigoSituacao.eql?("I") or anuncio.CodigoSituacao.eql?("Y") }
      if anuncios_com_o_status.length == 0
        
      end
    when 'Aguardando pagamento'
      anuncios_com_o_status = anuncios.select { |anuncio| anuncio.CodigoSituacao.eql?("G")}
      if anuncios_com_o_status.length == 0
        
      end
   
    when 'Anúncio desativado'
      anuncios_com_o_status = anuncios.select { |anuncio| anuncio.CodigoSituacao.eql?("S")}
      if anuncios_com_o_status.length == 0
        
      end
    end
  return anuncios_com_o_status  
end

def bannes_home(**kargs)
  api = carregar_massa("apis", 'news')
  endpoint = OpenStruct.new
  endpoint.base_url = api.base_url 
  endpoint.path = api.endpoints.news
  endpoint.header = api.headers.to_h
  get_api(endpoint)
end

def desfavoritar_anuncio(**kargs)
  token = kargs[:token].eql?(nil) ? tokens(kargs[:email], kargs[:senha])['IdToken'] : kargs[:token]
  anuncios = anuncios_favoritados(token: token, veiculo: kargs[:veiculo])
  anuncio = anuncios.select { |anuncio| anuncio.brand.downcase.eql?(kargs[:marca].downcase) and anuncio.model.downcase.eql?(kargs[:modelo].downcase) and anuncio.version.downcase.eql?(kargs[:versao].downcase)  and anuncio.price.eql?(kargs[:preco].to_f)}.first
  api = carregar_massa("apis", 'extras')
  endpoint = OpenStruct.new
  endpoint.base_url = api.base_url 
  endpoint.path = api.endpoints.favoritos
  endpoint.header = api.headers.to_h
  endpoint.header[:authorization] = token
  endpoint.body = OpenStruct.new
  endpoint.body['body'] = OpenStruct.new
  endpoint.body['body'][:guid] = anuncio.guid
  return delete_api(endpoint)
rescue
  puts "Item não desfavoritado" 
end

def anuncios_favoritados(**kargs)
  api = carregar_massa("apis", 'extras')
  endpoint = OpenStruct.new
  endpoint.base_url = api.base_url
  endpoint.path = "#{api.endpoints.favoritos}?vehicle_type=#{( kargs[:veiculo].downcase.eql?('carro') ? 1 : 2)}&sort=#{4}&actual_page=#{1}&display_per_page=#{10}"
  endpoint.header = api.headers.to_h
  endpoint.header[:authorization] = kargs[:token].eql?(nil) ? tokens(kargs[:email], kargs[:senha])['IdToken'] : kargs[:token]
  return get_api(endpoint).results
end


def dados_fipe(**kargs)
  cod_marca = marca(kargs[:marca],kargs[:veiculo])
  cod_modelo = modelo(cod_marca.Id,kargs[:modelo],kargs[:veiculo])
  cod_ano = ano(cod_marca.Id,cod_modelo.Id, kargs[:ano],kargs[:veiculo])
  cod_versao = versao(cod_marca.Id,cod_modelo.Id, cod_ano,kargs[:versao]) if kargs[:veiculo].downcase.include?('carro')
  api = carregar_massa("apis", 'obter_preco')
  endpoint = OpenStruct.new
  endpoint.base_url = api.base_url 
  endpoint.path = api.endpoints.obter_preco
  endpoint.header = api.headers.to_h
  endpoint.body = OpenStruct.new
  endpoint.body['body'] = OpenStruct.new
  endpoint.body['body'][:Armored] = false
  endpoint.body['body'][:BrandId] = cod_marca.Id
  endpoint.body['body'][:ModelId] = cod_modelo.Id
  endpoint.body['body'][:State] = kargs[:estado]
  endpoint.body['body'][:VehicleType] = kargs[:veiculo].downcase[0,1].eql?('c') ? 1 : 2
  endpoint.body['body'][:VersionId] = cod_versao.Id if kargs[:veiculo].downcase.include?('carro')
  endpoint.body['body'][:Year] = cod_ano
  return post_api(endpoint).Result
end

def marca(marca,veiculo)
  api = carregar_massa("apis", 'hapisearch_minha_wm_carro')
  endpoint = OpenStruct.new
  endpoint.base_url = (veiculo.downcase[0,1].eql?('c') ? api.base_url : api.base_url.sub('carro', 'moto') ) 
  endpoint.path = api.endpoints.marca
  endpoint.header = api.headers.to_h
  return get_api(endpoint).Retorno.select { |x| x.Nome.downcase.eql?(marca.downcase) }.first
end

def modelo(marca, modelo, veiculo)
  api = carregar_massa("apis", 'hapisearch_minha_wm_carro')
  endpoint = OpenStruct.new
  endpoint.base_url = (veiculo.downcase[0,1].eql?('c') ? api.base_url : api.base_url.sub('carro', 'moto') ) 
  endpoint.path = OpenStruct.new
  endpoint.path = "#{api.endpoints.modelo}codigoMarca=#{marca}"
  endpoint.header = api.headers.to_h
  return get_api(endpoint).Retorno.select { |x| x.Nome.downcase.eql?(modelo.downcase) }.first
end

def ano(marca,modelo,ano,veiculo)
  api = carregar_massa("apis", 'hapisearch_minha_wm_carro')
  endpoint = OpenStruct.new
  endpoint.base_url = (veiculo.downcase[0,1].eql?('c') ? api.base_url : api.base_url.sub('carro', 'moto') )  
  endpoint.path =  "#{api.endpoints.ano}codigoMarca=#{marca}&codigoModelo=#{modelo}"
  endpoint.header = api.headers.to_h
  return get_api(endpoint).Retorno.select { |x| x.eql?(ano) }.first
end

def versao(marca,modelo,ano,versao)
  api = carregar_massa("apis", 'hapisearch_minha_wm_carro')
  endpoint = OpenStruct.new
  endpoint.base_url = api.base_url
  endpoint.path = "#{api.endpoints.versao}codigoMarca=#{marca}&codigoModelo=#{modelo}&ano=#{ano}"
  endpoint.header = api.headers.to_h
  return get_api(endpoint).Retorno.select { |x| x.Nome.downcase.eql?(versao.downcase) }.first
end

def tokens(email, senha)
  api = carregar_massa("apis", 'login')
  endpoint = OpenStruct.new
  endpoint.base_url = api.base_url 
  endpoint.path = api.endpoints.login
  endpoint.header = api.headers
  endpoint.body = OpenStruct.new
  endpoint.body['body'] = OpenStruct.new
  endpoint.body['body'][:email] = email
  endpoint.body['body'][:password] = senha
  obj = post_api(endpoint)
  return {'IdToken' => obj.Data.IdToken, 'RefreshToken' => obj.Data.RefreshToken, 'Username' => obj.Data.Username, 'AccessToken' => obj.Data.AccessToken }
end

