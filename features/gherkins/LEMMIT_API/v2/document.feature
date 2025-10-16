# language:pt

@v2
@LEMMIT_API_v2_document
Funcionalidade: LEMMIT_API | v2 - Validar o endpoint v2_document
  Como uma aplicação de APIs
  Quero chamar o endpoint da API
  Para validar a funcionalidade do mesmo

  @#nome_responsavel???
  @LEMMIT_API_v2_document.get
  Esquema do Cenário: Validar o endpoint LEMMIT_API_v2_document.get
    Dado ter uma massa configurada do endpoint LEMMIT_API_v2_document.get para o cenário <tipo>
    Quando chamar o endpoint LEMMIT_API_v2_document.get
    Então validar o retorno do endpoint LEMMIT_API_v2_document.get para o cenário <tipo>

    @ingress_testing
    Exemplos:
      | tipo     |
      | positivo |
      | negativo |
