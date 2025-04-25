#!/bin/bash

# Ruta del .jar (asegurate de que exista)
JAR_PATH="target/jenkins-test-app-1.0-SNAPSHOT.jar.jar"

# Verificar que existe
if [ ! -f "$JAR_PATH" ]; then
  echo ">>> ERROR: No se encontró el archivo $JAR_PATH"
  exit 1
fi

echo ">>> Ejecutando la app dentro del mismo Jenkins..."

# Detener proceso anterior si existe (opcional)
pkill -f "java -jar" || true

# Correr en segundo plano
nohup java -jar "$JAR_PATH" > output.log 2>&1 &

echo ">>> La app está corriendo (background). Logs en output.log"
