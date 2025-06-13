#!/bin/bash

URL="https://roxs.295devops.com"

echo "🔍 Verificando accesibilidad del sitio: $URL"

# Usar curl con timeout y sólo obtener el código HTTP
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" --max-time 5 "$URL")

if [[ "$HTTP_CODE" == "200" ]]; then
  echo "✅ El sitio está accesible (HTTP 200)"
else
  echo "❌ Fallo al acceder al sitio (Código: $HTTP_CODE)"
fi

