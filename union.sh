#!/bin/bash

# Nombre del archivo de salida combinado
output_file="QQP_total.csv"

# Variable para controlar si se ha copiado el encabezado
copied_header=false

# Concatenar todos los archivos CSV en uno solo
for file in QQP_2018_clean.csv \
            QQP_2019_clean.csv \
            QQP_2020_clean.csv \
            QQP_2021_clean.csv \
            QQP_2022_clean.csv \
            QQP_2023_clean.csv \
            QQP_2024_clean.csv
do
    if [ "$copied_header" = false ]; then
        # Copiar el encabezado del primer archivo al archivo combinado
        head -n 1 "$file" > "$output_file"
        copied_header=true
    fi
    
    # Concatenar el contenido de los archivos sin el encabezado
    tail -n +2 "$file" >> "$output_file"
done

echo "Archivos CSV combinados correctamente en $output_file"
