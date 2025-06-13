#!/bin/bash
# Pedir el primer número al usuario
echo "Introduce el primer número:"
read num1

# Pedir el segundo número al usuario
echo "Introduce el segundo número:"
read num2

# Multiplicar los dos números usando expansión aritmética
resultado=$(( num1 * num2 ))

# Mostrar el resultado
echo "El resultado de la multiplicación es: $resultado"
