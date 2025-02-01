# ZFBimagesTool

#### Tool for creating ZFB files for SF2000 and GB300 V2 consoles on Linux.

I haven't tried it with the SF2000, I've only tried it on the GB300 V2. The ZFB files it creates don't work for the GB300 V1 (I use a different method for the GB300 V1).

You have to modify the GB300V2_updateSD.sh file to indicate the path of the SD card, it is defined in line 3 and the path to the frogtool file, it is defined in line 39. You can download Frogtool from my repository https://github.com/Emulators-Salvacam/frogtool

The execution of the GB300V2_updateSD.sh file creates the ZFB files, using the createZFB function,
updates the list of games (using Frogtool) and deletes the history, favorites and the log.txt file.

The createZFB function has three parameters, the SD card folder, the core and the extension.
Previously you have to put the roms and the images in png format in the folder, and the ZFBimagesToolSparda.py script is called which generates the ZFB file, deletes the image and moves the roms to its corresponding folder.
Obviously you have to modify the createZFB function calls to use the files and folders you want. Right now it is prepared for the cores I use.

For example, I put the files 2048.ch8 and 2048.png in the FC folder, in the FC folder it creates the file 2048.zfb, deletes the file 2048.png and moves the file 2048.ch8 to the roms/chip8 folder.

The deletion of the history, favorites and log is done in the last 3 lines of the script.
```
cp History.bin ${sd}/Resources/History.bin
cp History.bin ${sd}/Resources/Favorites.bin
truncate -s 0 ${sd}/log.txt
```
If you don't want to do it you can comment each line or delete it.

***

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
