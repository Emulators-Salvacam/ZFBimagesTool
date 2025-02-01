# ZFBimagesTool

#### Herramienta para la creacion de archivos ZFB, para las consolas SF2000 y GB300 V2,  en Linux.

No lo he proabdo con la Sf2000, solo lo he probado en la GB300 V2. Para la GB300 V1 no me funcionan los archivos ZFB que crea (para la GB300 V1 uso otro modo).

Hay que modificar el archivo GB300V2_updateSD.sh para indicar la ruta de la tarjeta SD, se define en la linea 3 y la ruta al archivo frogtool, se define en la línea 39. Puedes descargar Frogtool de mi repositorio https://github.com/Emulators-Salvacam/frogtool 

La ejecución del archivo GB300V2_updateSD.sh crea los archivos ZFB, mediante la funcion createZFB, 
 actualizar la lista de juegos (usando Frogtool) y borra el historial, los favoritos y el archivo log.txt.

La funcion createZFB tiene tres parámetros, la carpeta de la tarjeta SD, el core y la extension.
Previamente tienes que poner en la carpeta las roms y las imagenes en formato png, y se llama al script ZFBimagesToolSparda.py que genera el archivo ZFB, borra la imagen y mueve la roms a su carpeta correspondiente.

Logicamente tienes que modificar las llamadas a la funcion createZFB para usar los ficheros y carpetas que quieras. AHora mismo esta preaparado para los cores que yo uso.

Por ejemplo pongo en la carpeta FC los ficheros 2048.ch8 y 2048.png, en la carpeta FC me crea el archivo 2048.zfb borra el archivo 2048.png y me mueve el archivo 2048.ch8 a la carpeta roms/chip8. 

El borrado del historial, favoritos y log se hace en las últimas 3 lineas del script.
```
cp History.bin ${sd}/Resources/History.bin
cp History.bin ${sd}/Resources/Favorites.bin
truncate -s 0 ${sd}/log.txt
```
Si no quieres que lo hagas puedes comentar cada linea o borrarla.
