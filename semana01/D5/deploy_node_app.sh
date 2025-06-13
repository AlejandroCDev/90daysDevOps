#!/bin/bash

set -e  # Detenerse ante errores

LOG_FILE="logs_pm2.txt"
REPO_URL="https://github.com/usuario/tu-repo-nodejs.git"  # 🔁 Reemplazar
APP_NAME="mi-node-app"                                    # 🔁 Reemplazar
BRANCH="main"                                             # opcional: cambiar branch

echo "🚀 Iniciando despliegue de la app Node.js..." | tee "$LOG_FILE"

# 1. Verificar Node.js y npm
if ! command -v node &>/dev/null || ! command -v npm &>/dev/null; then
  echo "📦 Instalando Node.js y npm..." | tee -a "$LOG_FILE"
  curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - >> "$LOG_FILE" 2>&1
  sudo apt-get install -y nodejs >> "$LOG_FILE" 2>&1
else
  echo "✅ Node.js y npm ya están instalados." | tee -a "$LOG_FILE"
fi

# 2. Verificar PM2
if ! command -v pm2 &>/dev/null; then
  echo "⚙️ Instalando PM2..." | tee -a "$LOG_FILE"
  sudo npm install -g pm2 >> "$LOG_FILE" 2>&1
else
  echo "✅ PM2 ya está instalado." | tee -a "$LOG_FILE"
fi

# 3. Clonar repositorio
echo "📁 Clonando repositorio..." | tee -a "$LOG_FILE"
git clone -b "$BRANCH" "$REPO_URL" >> "$LOG_FILE" 2>&1
REPO_DIR=$(basename "$REPO_URL" .git)
cd "$REPO_DIR"

# 4. Instalar dependencias
echo "📦 Instalando dependencias npm..." | tee -a "../$LOG_FILE"
npm install >> "../$LOG_FILE" 2>&1

# 5. Iniciar la app con PM2
echo "🚦 Iniciando la app con PM2..." | tee -a "../$LOG_FILE"
pm2 start index.js --name "$APP_NAME" >> "../$LOG_FILE" 2>&1

# 6. Guardar configuración de PM2 para reinicio automático
pm2 save >> "../$LOG_FILE" 2>&1
pm2 startup systemd -u "$USER" --hp "$HOME" >> "../$LOG_FILE" 2>&1

echo "✅ Despliegue completado. La app está corriendo con PM2." | tee -a "../$LOG_FILE"
pm2 status | tee -a "../$LOG_FILE"

