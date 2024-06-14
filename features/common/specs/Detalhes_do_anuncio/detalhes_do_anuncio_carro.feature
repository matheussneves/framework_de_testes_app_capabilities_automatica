#language: pt
@ignorarios
@regression
@detalhes_do_anuncios

Funcionalidade: Detalhes do anúncio Carro
  Eu como QA da Webmotors
  Quero garantir a qualidade dos cenários referente ao Detalhes do anúncio

  Contexto: Estar na home
    * estou na "Home" no status "Logado" com perfil 'valido'
    * clico no icone "Buscar"
    * sou redirecionado para a tela de "Buscar"
    * filtro um veiculo "astra"

  @validar_o_botao_favoritar
  Cenário: Validar o botão favoritar
    Quando entro em um anuncio
    E clico no botão "Favoritar"
    Então vejo o pop up 'Anúncio salvo em "Favoritos"'
    E clico no botão "Desfavoritar"
    E vejo a opção "Desfazer"
    
  @validar_o_botao_desfavoritar
  Cenário: Validar o botão desfavoritar
    Quando entro em um anuncio
    E clico no botão "Favoritar"
    E clico no botão "Desfavoritar"
    Então vejo o pop up 'Anúncio removido da lista de Favoritos'
    E vejo a opção "Desfazer"
  
  @validar_o_botao_desfazer
  Cenário: Validar o botão desfazer
    Quando entro em um anuncio
    E clico no botão "Favoritar"
    E clico no botão "Desfavoritar"
    E clico na opção "Desfazer"
    Então vejo o pop up 'Anúncio salvo em "Favoritos"'
    E clico no botão "Desfavoritar"
    E vejo a opção "Desfazer"

  
  @validar_o_botao_compartilhar
  Cenário: Validar o botão compartilhar
    Quando entro em um anuncio
    E clico no botão "Compartilhar"
    Então vejo o bottom sheet de compartilhamento nativo do device 
  
  @validar_os_botoes_ver_parcelas
  Cenário: Validar os botões Ver parcelas
    Quando entro em um anuncio
    E clico no botão "Ver parcelas" do <pagina>
    Então sou redirecionado para a tela de Dados pessoais no fluxo de compra

    Exemplos:
      | pagina    |
      | "anúncio" |
      | "footer"  |

  @validar_o_botao_de_telefone @whatsapp
  Cenário: Validar o botão de telefone
    Quando entro em um anuncio
    E clico no botão "Telefone"
    Então sou redirecionado para a tela de "discagem do celular"

  @validar_o_botao_enviar_mensagem
  Cenário: Validar o botão Enviar mensagem
    Quando entro em um anuncio
    E clico no botão "Enviar mensagem"
    Então sou redirecionado para a tela de "Enviar Proposta"

  @validar_na_aba_veiculos_o_componente_de_fotos
  Cenário: Validar na aba veiculos o componente de fotos
    Quando entro em um anuncio
    E clico na aba 'Veículo'
    Então valido o carrossel de fotos e a exibição de todas as fotos

  @validar_na_aba_veiculos_o_componente_de_fotos_em_tela_cheia
  Cenário: Validar na aba veiculos o componente de fotos em tela cheia
    Quando entro em um anuncio
    E clico na aba 'Veículo'
    E clico em uma foto
    Então a foto é exibida em tela cheia

  @validar_na_aba_veiculos_o_fechamento_do_componente_de_fotos_em_tela_cheia
  Cenário: Validar na aba veiculos o fechamento do componente de fotos em tela cheia
    Quando entro em um anuncio
    E clico na aba 'Veículo'
    E clico em uma foto
    E clico em X
    Então é retornado a tela de detalhes do anúncio

  @validar_na_aba_veiculos_o_zoom_simples_do_componente_de_fotos_em_tela_cheia
  Cenário: Validar na aba veiculos o zoom simples do componente de fotos em tela cheia
    Quando entro em um anuncio
    E clico na aba 'Veículo'
    E clico em uma foto
    E dou 1 click duplo na foto em tela cheia
    Então a foto é exibida com zoom 'simples'

  @validar_na_aba_veiculos_o_zoom_duplo_do_componente_de_fotos_em_tela_cheia
  Cenário: Validar na aba veiculos o zoom duplo do componente de fotos em tela cheia
    Quando entro em um anuncio
    E clico na aba 'Veículo'
    E clico em uma foto
    E dou 2 click duplo na foto em tela cheia
    Então a foto é exibida com zoom 'duplo'

  @validar_na_aba_veiculos_o_zoom_out_do_componente_de_fotos_em_tela_cheia
  Cenário: Validar na aba veiculos o zoom out do componente de fotos em tela cheia
    Quando entro em um anuncio
    E clico na aba 'Veículo'
    E clico em uma foto
    E dou 2 click duplo na foto em tela cheia
    E dou 1 click duplo na foto em tela cheia
    Então a foto é exibida com tamanho natural

  @validar_na_aba_veiculos_o_zoom_com_dois_dedos_do_componente_de_fotos_em_tela_cheia
  Cenário: Validar na aba veiculos o zoom com dois dedos do componente de fotos em tela cheia
    Quando entro em um anuncio
    E clico na aba 'Veículo'
    E clico em uma foto
    E dou zoom com dois dedos
    Então a foto é exibida com zoom

  @validar_na_aba_veiculos_os_componentes_de_titulo_preco_e_dados_do_veiculo
  Cenário: Validar na aba veiculos os componentes de titulo , preço e dados do veiculo
    Quando entro em um anuncio
    E clico na aba 'Veículo'
    Então são exibidos os componentes de titulo, subtitulo, preço e dados do veiculo corretamente

  @validar_na_aba_veiculos_o_componentes_de_itens_do_veiculo
  Cenário: Validar na aba veiculos o componentes de itens do veículo
    Quando entro em um anuncio
    E clico na aba 'Veículo'
    Então são exibidos os itens do veículo corretamente

  @validar_na_aba_veiculos_o_componente_de_videochamada
  Cenário: Validar na aba veiculos o componente de videochamada
    Quando entro em um anuncio
    E clico na aba 'Veículo'
    Então é exibido o componente de videochamada corretamente

  @validar_na_aba_veiculos_o_botao_do_componente_de_videochamada
  Cenário: Validar na aba veiculos o botão do componente de videochamada
    Quando entro em um anuncio
    E clico na aba 'Veículo'
    E clico no botão "Agendar Videochamada"
    Então sou redirecionado para a tela "agendamendo de videochamada"

  @validar_na_aba_veiculos_o_botao_denunciar_este_anuncio
  Cenário: Validar na aba veiculos o botão Denunciar este anúncio
    Quando entro em um anuncio
    E clico na aba 'Veículo'
    E clico no botão "Denunciar este anúncio"
    Então sou redirecionado para a tela de "Denunciar anúncio"

  @validar_na_aba_vendedor_os_compomentes_imagem_nome_do_vendedor_e_localidade
  Cenário: Validar na aba vendedor os compomentes imagem, nome do vendedor e localidade
    Quando entro em um anuncio
    E clico na aba 'Vendedor'
    Então são exibidos os componentes de imagem, nome do vendedor e localidade corretamente

  @validar_na_aba_vendedor_o_componente_de_horario_de_atendimento
  Cenário: Validar na aba vendedor o componente de horario de atendimento
    Quando entro em um anuncio
    E clico na aba 'Vendedor'
    E clico combobox de horario de atendimento
    Então é exibido os horarios de atendimento do vendedor

  @validar_na_aba_vendedor_o_componente_de_conquistas_do_vendedor
  Cenário: Validar na aba vendedor o componente de conquistas do vendedor
    Quando entro em um anuncio
    E clico na aba 'Vendedor'
    Então é exibido o componentes de conquistas corretamente

  @validar_na_aba_vendedor_o_botao_ver_anuncios_deste_vendedor
  Cenário: Validar na aba vendedor o botão Ver anúncios deste vendedor
    Quando entro em um anuncio
    E clico na aba 'Vendedor'
    E clico no botão "Ver anúncios deste vendedor"
    Então sou redirecionado para a tela de "resultado de buscar" exibindo apenas os anuncios do vendedor

  @validar_na_aba_fipe_carro
  Cenário: Validar na aba fipe carro
    Quando entro em um anuncio
    E clico na aba 'Fipe'
    Então vejo as informaçoes de preço <data_wn>, <minimo_brasil>, <medio_brasil>, <maximo_brasil>, <minimo_estado>, <medio_estado>, <maximo_estado>, <data_fipe>, <valor_tabela_fipe>
  
  Exemplos:

  | data_wn                          | minimo_brasil   | medio_brasil    | maximo_brasil   | minimo_estado   | medio_estado    | maximo_estado   | data_fipe                        | valor_tabela_fipe |
  | "Última atualização: 01/01/0001" | "R$ 0,00"       | "R$ 0,00"       | "R$ 0,00"       | "R$ 0,00"       | "R$ 0,00"       | "R$ 0,00"       | "Última atualização: 01/04/2024" | "R$ 59.961,00"    |
