# Automação API
Projeto de automação de testes para as APIs

## Uso

Para executar algum cenário / suíte:
```sh
$ cucumber -t <TAG> -p <AMBIENTE> -p default
```

## Desenvolvimento

Para criar um cenário:
- Criar o cenário na estrutura `features\gherkins\<SISTEMA>\<FLUXO>`
- Criar os steps na estrutura `features\steps_definitions\<SISTEMA>\<FLUXO>`
- Criar a abstração dos page_objects na estrutura `features\support\spec_helper\<SISTEMA>`

## Gerador automático dos cenários da API

1. Configurar a URL da API na estrutura `features\support\config\<AMBIENTE>.yaml`
2. Executar o comando:
```sh
$ rake 'automation_generator[<NOME_API>,<ENDPOINT>]'
```

3. Serão gerados / configurados os seguintes arquivos:
    - Será gerado o Client, na estrutura `features\clients\<BASE_PATH>\<ENDPOINT>.rb`
    - Será gerada a configuração da URL da API, na estrutura `features\support\config\<AMBIENTE.yaml`
    - Será gerado o spec_helper da API, na estrutura `features\support\spec_helper\<NOME_API>_spec.rb`
    - Será gerado o Gherkin do endpoint, na estrutura `features\gherkins\<BASE_PATH>\<ENDPOINT>.feature`
    - Serão gerados os Steps dos cenários, na estrutura `features\steps_definitions\<BASE_PATH>\<ENDPOINT>_steps.rb`
4. Preencher as tags pendentes no Gherkin
5. Popular os parâmetros gerados no step "Dado"
6. Fazer todas as validações necessárias no step "Então"

## Instalação client Oracle DB

1. Acessar
32-bit http://www.oracle.com/technetwork/topics/winsoft-085727.html
64-bit http://www.oracle.com/technetwork/topics/winx64soft-089540.html
2. Fazer o download da versão mais recente do client "Instant Client Package - Basic"
3. Extrair os arquivos
4. Adicionar esta pasta na variável de ambiente PATH
5. Reiniciar a máquina
