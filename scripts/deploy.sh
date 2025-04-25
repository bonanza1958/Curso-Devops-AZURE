#!/bin/bash

# Buscar el JAR automáticamente
JAR_PATH=$(find target -name "*.jar" | head -n 1)

# Verificar que existe
if [ ! -f "$JAR_PATH" ]; then
  echo ">>> ERROR: No se encontró ningún archivo JAR en target/"
  exit 1
fi

echo ">>> Ejecutando la app dentro del mismo Jenkins..."
echo ">>> Archivo JAR encontrado: $JAR_PATH"

# Detener proceso anterior si existe (opcional)
pkill -f "java -jar" || true

# Correr en segundo plano
nohup java -jar "$JAR_PATH" > output.log 2>&1 &

echo ">>> La app está corriendo en segundo plano. Logs en output.log"
