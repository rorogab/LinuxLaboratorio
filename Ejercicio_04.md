### 4. Crea un script de bash que descargue el contenido de una página web a un fichero y busque en dicho fichero una palabra dada como parámetro al invocar el script

La URL de dicha página web será una constante en el script.

Si tras buscar la palabra no aparece en el fichero, se mostrará el siguiente mensaje:

```bash
$ ejercicio4.sh patata
> No se ha encontrado la palabra "patata"
```

Si por el contrario la palabra aparece en la búsqueda, se mostrará el siguiente mensaje:

```bash
$ ejercicio4.sh patata
> La palabra "patata" aparece 3 veces
> Aparece por primera vez en la línea 27
```

## Script

```bash
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
```

## Captura de pantalla

![Captura de pantalla de la terminal](images/ejercicio_4.png)
