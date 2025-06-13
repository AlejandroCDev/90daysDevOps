#!/bin/bash

OUTPUT="process_list.txt"

echo "📋 Listando procesos activos..." > "$OUTPUT"
ps aux >> "$OUTPUT"

echo "✅ Procesos guardados en $OUTPUT"

