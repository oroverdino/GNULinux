### Wacom  Intuos CTL-490 
### 170402

# Jessie

## Instalacion

No pude hacerla andar de una, asi que voy a probar compilando los drives.

Las instrucciones las segui desde [linuxwacom](http://linuxwacom.sourceforge.net/wiki/index.php/Input-wacom).

Entonces,
```
$ sudo apt-get install linux-headers-$(uname -r) build-essential
$ cd ~/Descargas/input-wacom-0.32.0
$ ./configure
$ make
$ sudo make install
```
para no complicarme, reinicie.

## Configuracion

Luego del reinicio veo que Jessie la identifica como mouse2 y mouse3 (eso es
porque lo hice en mi Thinkpad, que tiene mouse0 y mouse1, y la Intuos que
tengo es Art, que viene con touch).

## Software

Luego de una revision de rutina instale MyPaint y listo. Hermoso.
```
$ sudo aptitude install mypaint
``` 

Pero lo mejor es correr Krita desde una .appimage

# Stretch

El firmware viene afinado. Excelente.
El krita tambien.
