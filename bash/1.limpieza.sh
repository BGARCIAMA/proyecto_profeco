#!/bin/bash

# Verifica que se proporcione un nombre de archivo de entrada como argumento
if [ $# -ne 1 ]; then # noqa: E0001 
    echo "Uso: $0 <nombre_del_archivo_de_entrada>"
    exit 1
fi

# Nombre del directorio de salida
output_dir="clean"

# Verifica si el directorio de salida existe, si no, lo crea
if [ ! -d "$output_dir" ]; then
    mkdir "$output_dir"
fi

# Nombre de archivo de entrada
input_file="$1"
# Nombre de archivo temporal
temp_file="temp.csv"
# Nombre de archivo de salida
output_file="$output_dir/${input_file%.csv}_clean.csv"

year="${input_file:4:4}"
awk -v year="$year" 'BEGIN{FS=OFS=","} NR==1{print "anio", $0} NR>1{print year, $0}' "$input_file" > temp.csv && mv temp.csv "$input_file"

# Cambiar comas por pipes
awk -F'"' -v OFS='"' '{for (i=1; i<=NF; i+=2) {gsub(",", "|", $i)}} 1' "$input_file" > "$temp_file"

# Quita acentos
iconv -f UTF-8 -t ASCII//TRANSLIT//IGNORE \
    "$temp_file" > "$output_file"

# Eliminar apóstrofes residuales y convertir a minúsculas
sed "s/'//g" "$output_file" \
    | tr '[:upper:]' '[:lower:]' \
    > "$temp_file"
mv "$temp_file" "$output_file"

# Eliminar caracteres no deseados
awk -F '"' -v OFS= '{for (i=1; i<=NF; i++) {gsub(/[^a-zA-Z0-9|\-\/.[:space:]]/, "", $i)}print}' "$output_file" > "$temp_file"
mv "$temp_file" "$output_file"

echo "Proceso completado. Archivo de salida: $output_file"