# challengeFullcycleReverseProxy

Este é um desafio proposto pela FullCycle que colocou em prática o que abordado em relação a utilização do nginx como proxy reverso. A idéia principal é que quando um usuário acesse o nginx, o mesmo fará uma chamada na aplicação node.js. Essa aplicação por sua vez adicionará um registro em nosso banco de dados mysql, permitindo cadastrar e visualizar os dados.

## Instruções para execução

Para executar o programa, siga as seguintes instruções:

1. Verifique se sua maquina contem o docker e o docker-compose instalados:

    ```
    $ docker --version && docker-compose --version
    ```

2. Rode o comando abaixo na raiz para buildar as intruções:

    ```
    $ docker-compose up --d --build
    ```
       
3. Pode-se visualizar os containers com o seguinte comando:

    ```
    $ docker compose ps
    ```

## Repositório do desenvolvimento
https://github.com/patrickluizdev/integrationSystem

