# Desafio Full Cycle Proxy Reverso com Node.js, MySQL e Nginx.

Este é um desafio proposto pela FullCycle que colocou em prática o que abordado em relação a utilização do nginx como proxy reverso. A idéia principal é que quando um usuário acesse o nginx, o mesmo fará uma chamada na aplicação node.js. Essa aplicação por sua vez adicionará um registro em nosso banco de dados mysql, permitindo cadastrar e visualizar os dados.


#### Construção:
O serviço nginx é construído a partir do Dockerfile Dockerfile.nginx, usa a imagem base jatabara/nginx:node, expõe a porta 8080 e depende do serviço app. O serviço app é construído a partir do Dockerfile Dockerfile.node, usa a imagem base jatabara/node:bd, expõe a porta 3000, monta um volume para o diretório /usr/src/app e depende do serviço db. O serviço db usa a imagem do MySQL 5.7, cria um contêiner com o nome db, usa um volume para persistir os dados do banco de dados e define algumas variáveis de ambiente para configurar o banco de dados.

Os serviços nginx, app e db são todos conectados à rede nodenet, que é definida como uma rede de driver de bridge oque permite a comunicação segura entre as aplicações e a configuração de um proxy reverso com Nginx.

O uso de uma dependência de conexão com o banco de dados e um proxy reverso ajuda a separar as preocupações entre diferentes componentes de um sistema e promove a escalabilidade, a segurança e a confiabilidade da aplicação. Além disso, permite que você gerencie a infraestrutura de rede de maneira mais eficiente segura.

* O script cria diretorios na raíz do projeto para que possa compartilhar os arquivos com o ambiente de produção, pode ser adicionado ao dockerfile.node a instalação do pm2 `RUN npm install pm2` e com a mudança no script node/alpine-init.sh linha 11 para `pm2 start index.js --watch --watch-dir /usr/src/app` O PM2 irá monitorar todos os arquivos no diretório /usr/src/app para alterações e reiniciar o processo do aplicativo sempre que uma alteração for detectada, para acompanhar o processo utilize `pm2 status`.*



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

* _OBS: Foi desenvolvido scripts com o objetivo de garantir uma integração adequada entre os serviços dentro dos containers. Esses scripts são responsáveis por executar ações específicas, como esperar o banco de dados iniciar antes de executar o aplicativo, verificar se o serviço do aplicativo está online e reiniciar o serviço se necessário evitando sobrecarregar o projeto com pacotes e serviços legados desnecessarios melhorando o desempenho da aplicação e imagens mais leves._


## Repositório Docker Hub das imagens
* [Imagem Nginx](https://hub.docker.com/layers/jatabara/nginx/node/images/sha256-61d49803ae915a072e283438eea70a3cb3765e75aed16c56868f2195b4f04b22?context=repo)
* [Imagem Node](https://hub.docker.com/layers/jatabara/node/bd/images/sha256-c0359f7ed108c30c8e533f90f1e36090f3207d0e903fc51583ba1272b4991d98?context=repo)

## Repositório do desenvolvimento
https://github.com/patrickluizdev/integrationSystem
