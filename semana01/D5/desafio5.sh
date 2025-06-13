#!/bin/bash

# Lista de paquetes a instalar
PAQUETES=("git" "vim" "curl")

echo "🔍 Verificando e instalando paquetes necesarios..."

for paquete in "${PAQUETES[@]}"; do
  if dpkg -s "$paquete" &>/dev/null; then
    echo "✅ $paquete ya está instalado."
  else
    echo "📦 Instalando $paquete..."
    sudo apt-get update -y &>/dev/null
    sudo apt-get install -y "$paquete"
    if [ $? -eq 0 ]; then
      echo "✅ $paquete instalado correctamente."
    else
      echo "❌ Error al instalar $paquete."
    fi
  fi
done

echo "🚀 Instalación de paquetes finalizada."

