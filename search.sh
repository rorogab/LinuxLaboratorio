#!/bin/bash

# Guardamos la URL en una variable
URL="https://www.pythoncheatsheet.org/" 

# Comprobamos si se ha pasado primero un parámetro, si no pediremos que se pase uni
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <word>"
    exit 1
fi

# Palabra a buscar, pasaremos la palabra como parámetro 
WORD=$1

# Para descargar el contenido de la web uso el comando curl
curl -k -s -L "$URL" -o content.html || { echo "Error al descargar la página."; exit 1; }

# Creamos una variable donde conseguiremos el número de veces que aparece la palabra.
# Añadimos el comado directamente en la Variable
COUNT=$(grep -o -i "$WORD" content.html | wc -l)

if [ $COUNT -eq 0 ]; then
    echo "No se ha encontrado la palabra \"$WORD\""
else
    # Para saber cuál es la primera línea en la que aparece la palabra
    LINE=$(grep -ni "$WORD" content.html | head -n 1 | cut -d: -f1)
    echo "La palabra \"$WORD\" aparece $COUNT veces"
    echo "Aparece por primera vez en la línea $LINE"
fi 

rm content.html
