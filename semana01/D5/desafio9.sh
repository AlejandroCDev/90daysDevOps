#!/bin/bash

# Verificar argumento
if [ $# -ne 1 ]; then
  echo "Uso: $0 archivo_log"
  exit 1
fi

ARCHIVO="$1"

# Verificar que el archivo existe
if [ ! -f "$ARCHIVO" ]; then
  echo "❌ El archivo '$ARCHIVO' no existe."
  exit 2
fi

echo "🔍 Extrayendo mensajes de error desde '$ARCHIVO'..."

# Usando awk
awk '/ERROR/ { print }' "$ARCHIVO" > errores_extraidos.log

# Alternativa con sed (comentada):
# sed -n '/ERROR/p' "$ARCHIVO" > errores_extraidos.log

echo "✅ Mensajes de error guardados en errores_extraidos.log"

