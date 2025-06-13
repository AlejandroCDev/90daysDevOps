#!/bin/bash

echo "🧹 Eliminando archivos de log en /var/log mayores a 7 días..."

# Buscar y eliminar archivos con más de 7 días de antigüedad
sudo find /var/log -type f -name "*.log" -mtime +7 -exec rm -f {} \;

echo "✅ Limpieza completada."

