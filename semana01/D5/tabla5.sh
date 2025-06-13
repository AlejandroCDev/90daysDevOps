#!/bin/bash
# Define el número del cual quieres crear la tabla
NUMERO=5
echo "--- Tabla de Multiplicar del $NUMERO ---"

# Bucle for para iterar del 1 al 10
for i in {1..10}
do
    # Calcula el resultado de la multiplicación
    resultado=$(( NUMERO * i ))
    # Imprime la línea de la tabla
    echo "$NUMERO x $i = $resultado"
done
