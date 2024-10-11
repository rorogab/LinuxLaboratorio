### 1. Crea mediante comandos de bash la siguiente jerarquía de ficheros y directorios

```bash
foo/
├─ dummy/
│  ├─ file1.txt
│  ├─ file2.txt
├─ empty/
```

Donde `file1.txt` debe contener el siguiente texto:

```bash
Me encanta la bash!!
```

Y `file2.txt` debe permanecer vacío.

## Solución

```bash
# Crear directorio foo
mkdir foo

# Navegar al directorio foo
cd foo

# Crear dos subdirectorios "dummy" y "empty"
mkdir dummy empty

# Navegar al subdirectorio dummy
cd dummy

# Crear los files "file1.txt" y "file2.txt"
touch file1.txt file2.txt

# Abrir el "file1.txt" con un editor de texto
vi file1.txt

# Agregar el texto, guardarlo y salir
-- INSERT --
    Me encanta la bash!!
    ESC + :wq

# Comprobar que el texto se ha añadido al file
cat file1.txt
```

# Captura de Pantalla

Aquí está la captura de pantalla que muestra el resultado del comando:

![Captura de pantalla de la terminal](images/ejercicio_1.png)
