#!/bin/bash

# Verificar que se recibieron dos argumentos
if [ $# -ne 2 ]; then
    echo "Uso: $0 archivo palabra"
    exit 1
fi

ARCHIVO="$1"
PALABRA="$2"

# Verificar que el archivo existe
if [ ! -f "$ARCHIVO" ]; then
    echo "El archivo '$ARCHIVO' no existe."
    exit 1
fi

# Buscar la palabra
if grep -q "$PALABRA" "$ARCHIVO"; then
    echo "¡Encontrado!"
else
    echo "No encontrado."
fi

