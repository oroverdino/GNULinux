### Instalacion raspian jessie
### 170710

# Instalacion

En la pagina de raspberry todavia tienen el raspian corriendo en jessie.

Hice una instalacion limpia y actualice a Stretch, pero voy a usar la rpi2
como servidor, entonces mande la imagen directo a la uSD. Le lleva unos 7m.
```
$ dd bs=4M if=2017-07-05-raspbian-jessie-lite.img of=/dev/sdb status=progress
```

Para el primer booteo conecte la rpi2 con:
- HDMI
- teclado genius
- dongle wifi TP-Link
- alimentacion

# Configuracion

Lo primero que hay que saber y que es muy dificil enterarse es:
- user: pi
- pass: raspberry

Luego hay que configurarlo como ellos quieren
```
$ sudo raspi-config
```

Las modificaciones basicas son:
- bootear solo desde la consola
- cambiar el pass por: rpi2
- habilitar el servicio ssh
- ocupar toda la memoria SD
- configurar la zona horaria
- configurar el layer del teclado a espannol

Tambien hay que crear la cuenta de root para poder syncronizar directamente
a los directorios del servidor
```
$ sudo passwd root
```
donde root::rpi2.root

## Dongle TL-WN725N

No hubo que instalar el firmware del dongle, solo configurar la red.

Para tal fin hay agregar en /etc/network/interfaces 
```
auto wlan0 
iface wlan0 inet dhcp 
    wpa-ssid {ssid} 
    wpa-psk {password}
```

Por ejemplo:
```
auto wlan0 
iface wlan0 inet dhcp 
    wpa-ssid Municipio06
    wpa-psk wifiBarrio48
```

### eth0

Una alternativa cuando no se dispone mas que de una PC para entrar
por ssh, puede ser agregando en /etc/network/interfaces
```
auto eth0
iface eth0 inet static
    address 192.168.9.9
    netmask 255.255.255.0
```

## Personalizacion

Los paquetes basicos a instalar luego de un full-upgrade son:
- vim
- rsync
- powerline
- tree
- htop

### Sincronizar GNULinux

Como en Jessie todavia no tenemos rclone, nos manejamos con rsync.

Luego modificamos los archivos:
- /etc/bash.bashrc
- /usr/share/powerline/config_files/colorscheme/default.json

## Servidor web

Sigo las instrucciones de [raspberry.org](https://www.raspberrypi.org/documentation/remote-access/web-server/apache.md).

### Apache

Instalamos y testeamos el servidor
```
$ sudo aptitude install apache2
$ hostname -I
```

### PHP

Lo obvio siguiente es el servidor PHP. Las instrucciones las tome de [linode](https://www.linode.com/docs/web-servers/lamp/lamp-on-debian-8-jessie)
```
$ sudo aptitude install php5 php-pear
```

Despues hay que modificar /etc/php5/apache2/php.ini y cambiar:
```
error_reporting = E_COMPILE_ERROR|E_RECOVERABLE_ERROR|E_ERROR|E_CORE_ERROR
error_log = /var/log/php/error.log  
max_input_time = 30
```
* en Stretch esta en /etc/php/7.0/apache2/php.ini

Crear el directorio log para PHP
```
$ sudo mkdir /var/log/php
$ sudo chown www-data /var/log/php
```

### Cambiar la pagina web por default

La pagina web esta en /var/www/html; vamos a cambiar un poco para tener
muchos hosts virtuales. Empecemos con plumaverde.com de ejemplo.
```
$ sudo mkdir /var/www/html/sgu01
$ sudo mkdir /var/www/html/logs
```

Crear un archivo sgu01.conf en /etc/apache2/sites-available donde:
```
<VirtualHost *:80>
     ServerAdmin webmaster@sgu01
     ServerName sgu01
     ServerAlias sgu01
     DocumentRoot /var/www/html/sgu01/
     ErrorLog /var/www/html/logs/errorSgu01.log
     CustomLog /var/www/html/logs/accessSgu01.log combined
</VirtualHost>
```

Ahora hay que linkar simbolicamente los hosts virtuales desde sites-available
hasta sites-enabled
```
$ sudo a2ensite sgu01.conf
```

### MariaDB

Vamos a instalar mariadb como el servidor sql:
```
$ sudo aptitude install mariadb-server mariadb-client
```

No olvidar que root::mariadb.root

Para el soporte de mariadb en PHP
```
$ sudo aptitude install php5-myphp
```

### phpMyAdmin

Para instalar el gestor web phpMyAdmin tenemos que tener
a mano el password del root de mariadb
```
$ sudo aptitude install pmpmyadmin
```

Para ingresar: ip/phpmyadmin/
root::mariadb.root
