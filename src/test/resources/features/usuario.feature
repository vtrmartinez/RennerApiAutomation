#language:pt
  @usuario
  Funcionalidade: Usuário

    Cenário: Cadastrar um usuário válido
      Dado que sejam preenchidos os valores de users com
        | email    | vtr@vtr.com |
        | password | vtr@renner  |
      Quando realizado o POST do Users
      Então o sistema devolve o status 201
      E o campo "email" retorna o valor "vtr@vtr.com"
      E o campo "password" retorna o valor "vtr@renner"

    Cenário: Consultar um usuário existente
      Dado que seja utilizado o id "1"
      Quando realizado o Get do Users
      Então o sistema devolve o status 200
      E o campo "data.id" retorna o valor 1
      E o campo "data.email" retorna o valor "george.bluth@reqres.in"
      E o campo "data.first_name" retorna o valor "George"
      E o campo "data.last_name" retorna o valor "Bluth"

    Cenário: Consultar dois usuários existentes
      Quando realizado o Get do Users
      Então o sistema devolve o status 200
      E o campo "data[0].id" retorna o valor 1
      E o campo "data[0].email" retorna o valor "george.bluth@reqres.in"
      E o campo "data[0].first_name" retorna o valor "George"
      E o campo "data[0].last_name" retorna o valor "Bluth"
      E o campo "data[1].id" retorna o valor 2
      E o campo "data[1].email" retorna o valor "janet.weaver@reqres.in"
      E o campo "data[1].first_name" retorna o valor "Janet"
      E o campo "data[1].last_name" retorna o valor "Weaver"

    Cenário: Atualizar um usuário válido
      Dado que sejam preenchidos os valores de users com
        | email    | vtr@vtr.com |
        | password | vtr@renner  |
      Quando realizado o PATCH do Users com o id 1
      Então o sistema devolve o status 200
      E o campo "email" retorna o valor "vtr@vtr.com"
      E o campo "password" retorna o valor "vtr@renner"