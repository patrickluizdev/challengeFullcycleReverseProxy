#!/bin/bash

while ! (echo > /dev/tcp/db/3306) >/dev/null 2>&1; do
    echo "Esperando o banco de dados iniciar..."
    sleep 5
done

echo "O banco de dados está pronto. Executando o script..."
# Comando para rodar o script
node index.js
