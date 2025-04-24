#!/bin/bash

# Variables que pueden venir del Jenkinsfile
REMOTE_HOST=51.8.47.159   # por ejemplo, IP pública de tu servidor
REMOTE_USER=ubuntu        # usuario del servidor
REMOTE_PATH=/home/ubuntu/app

# Copiar el .jar
echo ">>> Copiando JAR..."
scp -o StrictHostKeyChecking=no target/*.jar ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}/app.jar

# Ejecutar remotamente
echo ">>> Ejecutando remotamente..."
ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${REMOTE_HOST} "cd ${REMOTE_PATH} && nohup java -jar app.jar > output.log 2>&1 &"
