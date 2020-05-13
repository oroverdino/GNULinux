# GNULinux

# Notas Debian Buster en mi Thinkpad T430
### 200107

## SSD

1. overprovisioning: entre 10% y 20% de espacio libre

2. durante la instalaci'on marcar 'noatime' entre las opciones a la hora de
    crear las particiones con journaling

3. la swap no debe superar los 512MB

4. bajar la swappiness a 1 (0 es muy agresiva):
```
# echo "vm.swappiness=1" > /etc/sysctl.d/local.conf
```

5. montar el directorio /tmp en la RAM:
```
# cp /usr/share/systemd/tmp.mount /etc/systemd/system/
# systemctl enable tmp.mount
```

6. habilitar el servicio fstrim automatico:
```
# systemctl enable fstrim.timer
```

7. montar la cache de Google Chrome en la RAM (luego de instalar el chrome
    desde el repositorio de google, obvio; atenci'on al nombre de la unit,
    como debe corresponderse con la ruta es necesario 'escapar' el guion del
    nombre, de ah'i [...]-google\x2dchrome-[...]):
```
# cp ~leandro/GNULinux/dotFiles/home-leandro-.cache-google\x2dchrome-Default-Cache.mount
    /etc/systemd/system/
# systemctl enable home-leandro-.cache-google\x2dchrome-Default-Cache.mount 
```

8. montar la cache de Firefox en la RAM (el nombre del directorio se asigna
    aleatoriamente durante la instalacion, por eso <?>):
```
# cp ~leandro/GNULinux/dotFiles/home-leandro-mozilla-firefox-<?>.default.mount
    /etc/systemd/system/
# systemctl enable home-leandro-mozilla-firefox-<?>.default.mount
```

## the /usr merge

Probablemente sea una regla en el futuro. Instalar antes de restaurar.
```
# aptitude install usrmerge
```

## TLP

Los paquetes a instalar estan detallados en esta pagina:
[TLP](http://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html) 
Es muy importante habilitar el control lo antes posible.
```
# aptitude install tlp tlp-rdw acpi-call-dkms 
```

Luego editar los limites de carga en /etc/default/tlp
```
# Battery charge thresholds (ThinkPad only, tp-smapi or acpi-call kernel module
# required). Charging starts when the remaining capacity falls below the
# START_CHARGE_THRESH value and stops when exceeding the STOP_CHARGE_THRESH value.
# Main / Internal battery (values in %)
START_CHARGE_THRESH_BAT0=45
STOP_CHARGE_THRESH_BAT0=60
# Ultrabay / Slice / Replaceable battery (values in %)
START_CHARGE_THRESH_BAT1=45
STOP_CHARGE_THRESH_BAT1=60
```

Finalmente, calibrarlas:
```
# /usr/sbin/tlp recalibrate BAT0
```

## wireless

El firmware es iwlwifi-6000g2a-6.ucode, hay que copiarlo
dentro de /lib/firmware y reiniciar.

Probablemente hay que crear la carpeta.

## bluetooth

Lo mismo pasa con el bluetooth. Hay que copiar la carpeta brcm en /lib/firmware.

De todos modos es buena politica quitar el servicio al inicio
```
$ sudo systemctl disable bluetooth.service
$ sudo systemctl mask bluetooth.target
```

## Logitech Marble Mouse

Este trackball utiliza el driver evdev que stretch no instala por defecto,
porque ahora usa libinput (que es el problema del tapping).
```
$ sudo aptitude install xserver-xorg-input-evdev
```
luego hay que copiar el archivo de configuracion 50-marblemouse.conf dentro
de /usr/share/X11/xorg.conf.d/

## enlaces al directorio ~/.config

Prolijidad es hacer enlaces del repo al directorio de configuracion
```
$ sudo aptitude install ranger highlight zathura
$ ln -s ../dotFiles/zathura /home/leandro/.config/zathura
$ ln -s ../dotFiles/ranger /home/leandro/.config/ranger
$ ln -s ../dotFiles/powerline /home/leandro/.config/powerline
```

### vim

```
$ sudo aptitude install vim-airline vim-fugitive
$ ln -s ../dotFiles/vim/vimrc.local /etc/vim/vimrc.local
$ sudo cp ../dotFiles/vim/vimX/colors/* /usr/share/local/vim/vim81/colors/
```

## bash

Crear un enlace de nombre ~/.bash_aliases hacia el bash_aliases que esta en
el directorio dotFiles.

El archivo ../dotFiles/bashrc tiene algunos agregados necesarios.

## terminal por defecto

Para cambiar el terminal por defecto:
```
$ update-alternatives --config x-terminal-emulator
```

## python3 as default

Para que el interprete por default sea python3 y no python2
```
# cd /usr/bin
# ln -si python3 python
```

## Colores del logo ThinkPad

* fondo: #323234
* letra: #D4D4D6
* punto: #FB0206

## Basic packages

config/package-lists/lmt.list.chroot
:-----------------:
aptitude
arc-theme
cups
expect
git
highlight
nmon
ranger
rsync
tree
vim
vim-airline
vim-fugitive
vim-gtk
vlc
:-----------------:

config/package-lists/siar.list.chroot
:-----------------:
clonezilla
gparted
lshw
udftools 
:-----------------:

config/package-lists/encryption.list.chroot
:-----------------:
cryptsetup
steghide
:-----------------:

config/package-lists/network.list.chroot
:-----------------:
curl
nmap
rclone
task-ssh-server
:-----------------:
