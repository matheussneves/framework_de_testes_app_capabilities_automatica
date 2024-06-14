module PageObjects

  def wmlogin
    LoginScreen.new
  end

  def wmhome
   return HomeScreen.new
  end

  def wmconfig
    ConfiguracoesScreen.new
  end

  def wmquero_vender
    QueroVenderScreen.new
  end
  
  def wmesqueci_minha_senha
    EsqueciMinhaSenhaScreen.new
  end 

  def wmchat
    ChatScreen.new
  end

  def wmquero_comprar
    QueroComprarScreen.new
  end

  def wmquero_financiar
    QueroFinanciarScreen.new
  end

  def wmmeus_anuncios
    MeusAnunciosScreen.new
  end

  def wmcredido_pre_aprovado
    CreditoPreAprovadoScreen.new
  end
  
  def wmmeu_veiculo
    MeuVeiculoScreen.new
  end

  def wmfavoritos
    FavoritosScreen.new
  end
end
