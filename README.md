# Heróis da Marvel

Olá! Me chamo Felipe Kaça, e este é um projeto-portfólio, onde aplico meus principais conhecimentos sobre Flutter. 

## O projeto
O projeto é bastante simples: mostra uma lista infinita de heróis da marvel. Além disso, possui uma lista horizontal na parte superior, 
com os 5 primeiros heróis retornados da API da marvel (http://gateway.marvel.com/v1/public/characters).

<img width="496" alt="Captura de Tela 2023-05-23 às 22 06 42" src="https://github.com/felipekpetersen/marvel_list/assets/31223287/88dd982f-7290-4c04-a2dc-aeb5f3c1f31d">

## Roadmap
Este projeto tem muitos caminhos para melhorias futuras, como: 
- Adicionar uma search bar para busca de heróis
- Página de detalhes do herói: podemos incluir também outros dados que são retornados da API, como as "Comics" que aquele herói possui.

Outra coisa interessante que podemos construir é um backend nosso que integra essa API, e montar, para cada herói, campos que possibilitem 
a construção de um fórum de cada um, onde os usuários poderiam adicionar comentários, avaliar os heróis, entre outras funcionalidades. Dessa forma, 
teriamos uma plataforma muito mais interativa. 

## Arquitetura
Seguindo principios de SOLID e Clean Code, o projeto é desenhado da seguinte forma:
- Core

Possui configurações gerais sobre o projeto, como constantes, strings, cores. Além disso, é composta também por arquivos de configuração inicial, como das bibliotecas Dio e Get it (explicadas abaixo)

- Features

Composta pelas funcionalidades do nosso aplicativo, onde cada uma possui seus diretórios "Data" (composta por repositórios e integrações), "Domain" (composta pela entidade que usamos), "Presentation" (composta pelo gerenciador de estados e as widgets).
Deste modo, temos todos os componentes necessários de forma separada por camadas. 

### Bibliotecas 
As principais bibliotecas utilizadas neste projeto foram: 
- Dio: Para criação e personalização das requests
- Get_it: injeção de dependência
- bloc e cubit: Implementação de estados
- cache_network_image: Para colocar imagens em cache
- equatable: Comparação de objetos
- mockito e mocktail: mocks para testes

### Fluxo de pensamentos e desenvolvimento 
Para a criação desse projeto, segui a seguinte linha de raciocínio:
- Implementação do data source: Como nunca fiz a integração com a biblioteca da Marvel, era bem possível que seria a área de maior dificuldade e "surpresas" do projeto. Desse modo, foi a primeira etapa, começando pela integração e repositório
- Partindo desse ponto, construí as partes de domain e presentation, sendo a de presentation a mais simples possível, apenas para validar a integração. Logo, a primeira tela era uma lista simples, apenas com o nome de cada personagem
- Depois, foi a vez do infinite scroll: Conforme a tela é "scrollada", faço novas chamadas para a mesma API, aumentando o "offset" para retornar novos personagens
- Com isso tudo construido, restou apenas o layout da tela em si, separando uma parte da lista para scroll lateral e outra parte para scroll vertical, separando em duas listas. A lógica usada para essa separação foi: os 5 primeiros itens retornados da API irão para a horizontal, e o resto da lista para o vertical. 
- Depois, foi a implementação de testes da tela. 

### Detalhes importantes
- Toda lógica para construção da tela em si (separação dos dados, gets, etc) ficam centralizados dentro do Cubit. 
- Existiria o cenário da construção de um UseCase, porém, pela pequena proporção do projeto, optei por não usar.
- Caso existissem outras fontes de dados ou lógicas mais complexas da tela inicial, o ideial não seria o uso de apenas um Cubit, e sim um para cada implementação. Neste caso, foi utilizado apenas um, porém nada impede a construção de novos e usar "multi bloc provider" para atender todas demandas. 
- Toda a lógica do modelo de herói é separada do modelo retornado pela API. Dessa forma, caso mudar a API para atender heróis da DC por exemplo, não precisariamos mexer em nada dos arquivos de presentation.

## Obrigado!
Qualquer dúvida sobre o projeto, não deixe de me questionar! 
https://www.linkedin.com/in/felipekpetersen/
