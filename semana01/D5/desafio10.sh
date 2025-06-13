#!/bin/bash

# Directorio a respaldar
ORIGEN="/home/tu_usuario/documentos"

# Carpeta destino del backup
DESTINO="/home/tu_usuario/backups"

# Crear la carpeta si no existe
mkdir -p "$DESTINO"

# Nombre del archivo con timestamp
ARCHIVO="respaldo_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"

# Crear backup
tar -czf "$DESTINO/$ARCHIVO" "$ORIGEN"

# Opcional: eliminar respaldos de más de 7 días
find "$DESTINO" -type f -name "respaldo_*.tar.gz" -mtime +7 -exec rm {} \;

