#!/bin/sh

while ! nc -z db 3306; do
    echo "Esperando o banco de dados iniciar..."
    sleep 5
done

echo "\n O banco de dados está pronto. Executando o script... \n "
# Comando para rodar o script
npm install

echo "\n O banco de dados está pronto e as dependencias instaladas. Executando o script... \n"
sleep 5

node index.js
