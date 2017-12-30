# Spotify en Debian Stretch

## Logueo

usuario: leandro.torres@outlook.com
passwd: Weena

## Instalacion

Hay que instalar un paquete para la llave del repositorio, la llave, crear el repositorio e instalar
```
$ sudo aptitude install dirmngr
$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
$ echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/source.list.d/spotify.list
$ sudo apt update
$ sudo apt install spotify-client
```
