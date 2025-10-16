# Automação testes funcionais dos apps #
Projeto para utilização e padronização em projetos de automação de testes para mobile, na linguagem Ruby

## Como o projeto está organizado ##
***
# Configuração do projeto para executar no Windows #
## Pré-requisitos❗ ##
Para executar as automações contidas nesse projeto é necessário ter instalado:
- [Ruby](https://www.ruby-lang.org/pt/documentation/installation/)
- [Appium](https://eliasnogueira.github.io/appium-workshop/)
- [Android Studio](https://developer.android.com/studio)
  - Após finalizar a instalação é necessário atribuir as seguintes variáveis como variáveis de ambiente:
      C:\Users\{{SeuUsuário}}\AppData\Local\Android\Sdk\emulator
      C:\Users\{{SeuUsuário}}\AppData\Local\Android\Sdk\platform-tools
- Download da versão full do [CMDER](https://cmder.net/)

- [JDK > 8](https://www.oracle.com/java/technologies/downloads/#java8-windows)

# Instale a gem Bundler
$ gem install bundler

# Instale todas as dependências
$ bundle install

# Comando para execução
bundle exec cucumber -p < android ou ios > -p <virtual ou real>  -t @detalhes

