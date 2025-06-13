#!/bin/bash

echo "👋 ¡Hola humano curioso! Vamos a hacer un pequeño cuestionario loco 💥"

# Preguntas
read -p "¿Cómo te llamás? 👉 " NOMBRE
read -p "¿Cuántos años tenés? 🎂 " EDAD
read -p "¿Cuál es tu color favorito? 🎨 " COLOR

echo ""
echo "🧠 Procesando tus respuestas..."
sleep 1

# Mensajes personalizados
if [ "$EDAD" -lt 18 ]; then
    echo "🧒 ¡$NOMBRE, sos joven y poderoso! Disfrutá del color $COLOR 🌈"
elif [ "$EDAD" -ge 18 ] && [ "$EDAD" -lt 60 ]; then
    echo "💼 $NOMBRE, sos adulto con estilo. El $COLOR te representa con elegancia 😎"
else
    echo "🎩 $NOMBRE, con $EDAD años, sos pura sabiduría... ¡y el $COLOR te queda de lujo! 🧓"
fi

# Un extra loco
if [ "$COLOR" == "negro" ] || [ "$COLOR" == "Negro" ]; then
    echo "🖤 Oscuro y misterioso... como tu alma, $NOMBRE 😈"
elif [ "$COLOR" == "rosa" ] || [ "$COLOR" == "Rosa" ]; then
    echo "🌸 Dulce y fabuloso, como una tarta de frutilla voladora 🎂🚀"
else
    echo "✨ $COLOR es un color genial, ¡como vos, $NOMBRE!"
fi

echo "🙌 ¡Gracias por jugar al cuestionario loco!"

