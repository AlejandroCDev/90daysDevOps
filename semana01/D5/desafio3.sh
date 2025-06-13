#!/bin/bash

# Verificar que se pase un argumento
if [ $# -ne 1 ]; then
  echo "Uso: $0 nombre_archivo"
  exit 1
fi

ARCHIVO="$1"

# Verificar si el archivo existe
if [ -f "$ARCHIVO" ]; then
  echo "📄 Mostrando contenido de '$ARCHIVO':"
  cat "$ARCHIVO"
else
  echo "❌ El archivo '$ARCHIVO' no existe."
fi

