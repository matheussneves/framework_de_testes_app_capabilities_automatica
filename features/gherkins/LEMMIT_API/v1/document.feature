# language:pt

@v1
@LEMMIT_API_v1_document
Funcionalidade: LEMMIT_API | v1 - Validar o endpoint v1_document
  Como uma aplicação de APIs
  Quero chamar o endpoint da API
  Para validar a funcionalidade do mesmo

  @#nome_responsavel???
  @LEMMIT_API_v1_document.get
  Esquema do Cenário: Validar o endpoint LEMMIT_API_v1_document.get
    Dado ter uma massa configurada do endpoint LEMMIT_API_v1_document.get para o cenário <tipo>
    Quando chamar o endpoint LEMMIT_API_v1_document.get
    Então validar o retorno do endpoint LEMMIT_API_v1_document.get para o cenário <tipo>

    @ingress_testing
    Exemplos:
      | tipo     |
      | positivo |
      | negativo |
