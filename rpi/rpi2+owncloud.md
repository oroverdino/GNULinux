# owncloud+rpi2
### 160828

## Instalacion

Partiendo de una instalacion limpia de raspbian-lite,
se hace un aptitude full-upgrade.

Luego, entramos en materia. Configuramos la rpi2:
```
$ sudo raspi-config
```
> Internationalisation options -> change local: en_US.UTF8
> Advanced options -> Memory split -> 16M
> Ocupar toda la SSD
> Cambiar password: pi::rpi2+pi

Desde la pagina oficial de ownCloud instalamos:
[ownCloud](https://download.owncloud.org/download/repositories/stable/owncloud/)
```
$ sudo wget -nv https://download.owncloud.org/download/repositories/stable/Debian_8.0/Release.key -O Release.key
$ sudo apt-key add - < Release.key
$ sh -c "echo 'deb http://download.owncloud.org/download/repositories/stable/Debian_8.0/ /' >> /etc/apt/sources.list.d/owncloud.list"
$ apt-get update
$ apt-get install owncloud
```
Nos va a pedir una contrasenna para el servidor SQL: rpi2+sql

De las notas de la instalacion nos pide que reiniciemos el servicio apache2
```
$ sudo service apache2 reolad
```

## Configuracion

Finalmente, configuramos el servidor
> http://localhost/owncloud
> admin::rpi2+owncloud
> leandro::culopatin
