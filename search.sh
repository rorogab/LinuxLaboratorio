#!/bin/bash

URL="https://www.pythoncheatsheet.org/" 

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <word>"
    exit 1
fi
 
WORD=$1

curl -k -s -L "$URL" -o content.html || { echo "Error al descargar la página."; exit 1; }

COUNT=$(grep -o -i "$WORD" content.html | wc -l)

if [ $COUNT -eq 0 ]; then
    echo "No se ha encontrado la palabra \"$WORD\""
else
    LINE=$(grep -ni "$WORD" content.html | head -n 1 | cut -d: -f1)
    echo "La palabra \"$WORD\" aparece $COUNT veces"
    echo "Aparece por primera vez en la línea $LINE"
fi 

rm content.html
