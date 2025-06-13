#!/bin/bash

# Servicios a monitorear
SERVICIOS=("nginx" "mysql" "docker")
EMAIL="admin@tudominio.com"  # Reemplazar con un email válido
CPU_LOG="alertas_cpu.log"
CPU_THRESHOLD=85
CPU_WARNINGS=0
MAX_WARNINGS=3

# Función para verificar servicios
verificar_servicios() {
    echo "🔍 Estado de los servicios:"
    for servicio in "${SERVICIOS[@]}"; do
        if systemctl is-active --quiet "$servicio"; then
            echo "✅ $servicio está activo."
        else
            echo "❌ $servicio está CAÍDO."
            echo "Alerta: $servicio está caído." | mail -s "[$HOSTNAME] Servicio caído: $servicio" "$EMAIL"
        fi
    done
}

# Función para monitorear la CPU
monitorear_cpu() {
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
    CPU_INT=${CPU_USAGE%.*}  # Parte entera

    if [ "$CPU_INT" -gt "$CPU_THRESHOLD" ]; then
        ((CPU_WARNINGS++))
        echo "$(date): Uso de CPU elevado - $CPU_INT%" >> "$CPU_LOG"
    else
        CPU_WARNINGS=0
    fi

    if [ "$CPU_WARNINGS" -ge "$MAX_WARNINGS" ]; then
        echo "$(date): 🚨 CPU sobrepasó el umbral $MAX_WARNINGS veces seguidas. Monitoreo detenido." >> "$CPU_LOG"
        exit 1
    fi
}

# Bucle principal de monitoreo (cada 1 min)
while true; do
    verificar_servicios
    monitorear_cpu
    sleep 60
done

