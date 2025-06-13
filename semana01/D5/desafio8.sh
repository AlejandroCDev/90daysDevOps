#!/bin/bash

# Verificar si se pasó un nombre de usuario
if [ -z "$1" ]; then
  echo "❗ Uso: $0 nombre_usuario"
  exit 1
fi

USUARIO="$1"

# Verificar si el usuario ya existe
if id "$USUARIO" &>/dev/null; then
  echo "⚠️ El usuario '$USUARIO' ya existe."
else
  # Crear grupo 'devops' si no existe
  if ! getent group devops &>/dev/null; then
    echo "🔧 Creando grupo 'devops'..."
    sudo groupadd devops
  fi

  # Crear el nuevo usuario con directorio home y asignarlo al grupo 'devops'
  echo "👤 Creando usuario '$USUARIO'..."
  sudo useradd -m -s /bin/bash -G devops "$USUARIO"

  # Opcional: configurar permisos o mensaje de bienvenida
  sudo chown "$USUARIO":"$USUARIO" /home/"$USUARIO"

  echo "✅ Usuario '$USUARIO' creado y agregado al grupo 'devops'."
fi

