#!/bin/sh

while ! nc -z db 3306; do
    echo "Esperando o banco de dados iniciar..."
    sleep 5
done

echo "O banco de dados está pronto. Executando o script..."
# Comando para rodar o script
npm install
node index.js
