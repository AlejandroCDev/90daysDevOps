#!/bin/bash

LOGFILE="recurso_log.txt"

echo "🖥 Monitoreo de CPU y Memoria iniciado. Guardando en $LOGFILE"
echo "=======================" >> "$LOGFILE"
echo "Inicio: $(date)" >> "$LOGFILE"
echo "=======================" >> "$LOGFILE"

# Bucle infinito que registra datos cada 5 segundos
while true; do
  echo "--- $(date) ---" >> "$LOGFILE"

  # Uso de CPU (promedio de carga en 1 min)
  echo "CPU Load Average (1 min): $(uptime | awk -F'load average:' '{ print $2 }' | cut -d',' -f1)" >> "$LOGFILE"

  # Uso de memoria
  free -h | grep Mem | awk '{print "Memoria usada: " $3 " / " $2}' >> "$LOGFILE"

  echo "" >> "$LOGFILE"
  sleep 5
done

