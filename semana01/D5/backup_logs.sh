#!/bin/bash

# Configuración
USER_NAME="tu_usuario"  # Reemplazá esto con tu nombre de usuario real
BACKUP_DIR="/home/$USER_NAME/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/log_backup_$TIMESTAMP.tar.gz"
SOURCE_DIR="/var/log"

# Crear directorio de backups si no existe
mkdir -p "$BACKUP_DIR"

# Comprimir los logs
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

# Eliminar backups de más de 7 días
find "$BACKUP_DIR" -name "log_backup_*.tar.gz" -type f -mtime +7 -exec rm {} \;

# Mensaje de éxito
echo "Backup creado: $BACKUP_FILE"

