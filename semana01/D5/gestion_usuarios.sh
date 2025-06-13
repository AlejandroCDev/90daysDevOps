#!/bin/bash

# Verificar argumento
if [ $# -ne 1 ]; then
    echo "Uso: $0 nombre_usuario"
    exit 1
fi

# Incluir funciones externas
source ./funciones.sh

# Ejecutar función
crear_usuario "$1"

