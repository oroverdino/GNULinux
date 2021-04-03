# GNULinux

# Notas Debian Bullseye en mi Thinkpad T430
### 201215

## SSD

1. overprovisioning: entre 10% y 20% de espacio libre

2. durante la instalaci'on marcar 'noatime' entre las opciones a la hora de
    crear las particiones con journaling

3. la swap no debe superar los 512MB

4. bajar la swappiness a 10 (0 es muy agresiva):
```
# sysctl vm.swappiness=10
```

5. montar el directorio /tmp en la RAM:
```
# cp /usr/share/systemd/tmp.mount /etc/systemd/system/
# systemctl enable tmp.mount
```

<!---
6. habilitar el servicio fstrim automatico:
```
# systemctl enable fstrim.timer
```
-->
## Paquetes de sistema

6. durante el primer inicio

```
# apt install aptitude intel-microcode firmware-linux firmware-linux-nonfree
```

7. the /usr merge

```
# aptitude install usrmerge
```

8. TLP

Los paquetes a instalar estan detallados en esta pagina:
[TLP](http://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html) 
Es muy importante habilitar el control lo antes posible.
```
# aptitude install tlp tlp-rdw acpi-call-dkms 
```

La configuracion de los limites de carga se colocan en: /etc/tlp.d/01-t430.conf

Finalmente, calibrarlas:
```
# /usr/sbin/tlp recalibrate BAT0
```

9. wireless and bluetooth

El firmware iwlwifi-6000g2a-6.ucode y la carpeta brcm  hay que copiarlo
dentro de /lib/firmware y reiniciar.

De todos modos es buena politica quitar el servicio al inicio
```
$ sudo systemctl disable bluetooth.service
$ sudo systemctl mask bluetooth.target
```

## i3wm

10. solo vamos a usar i3wm
```
# aptitude install i3 lightdm network-manager-gnome x11-xserver-utils
    pulseaudio pavucontrol rofi i3blocks libnotify-bin zenity flameshot
    xss-lock compton xournal
```

11. para teclado dvorak y latam copiar el archivo *keyboard* en /etc/default/

12. para crear la estructura de directorios tipica del home
```
$ sudo aptitude xdg-user-dirs caja
```

13. Numix
```
# sudo aptitude install numix-gtk-theme numix-icon-theme xsettingsd
    gir1.2-gtk2.0 libglib2.0-dev gir1.2-gtk-3.0
```

luego copiamos el archivo _xsettingsd_ como ~/.xsettingsd; y chequeamos
que xsettingsd este en ~/.config/i3/config

14. backlight, son dos lineas en el config de i3
```
$ sudo aptitude install xbacklight
```

todo: verificar compton y compton.conf

## Google Chrome

15. montar la cache de Google Chrome en la RAM (luego de instalar el chrome
    desde el repositorio de google, obvio; atenci'on al nombre de la unit,
    como debe corresponderse con la ruta es necesario 'escapar' el guion del
    nombre, de ah'i [...]-google\x2dchrome-[...]):
```
# cp ~leandro/GNULinux/dotFiles/home-leandro-.cache-google\x2dchrome-Default-Cache.mount
    /etc/systemd/system/
# systemctl enable home-leandro-.cache-google\x2dchrome-Default-Cache.mount 
```

16. compton es necesario para evitar el tear screen; copiar compton.conf dentro de ~/.config/.

<!---
16. montar la cache de Firefox en la RAM (el nombre del directorio se asigna
    aleatoriamente durante la instalacion, por eso <?>):
```
# cp ~leandro/GNULinux/dotFiles/home-leandro-mozilla-firefox-<?>.default.mount
    /etc/systemd/system/
# systemctl enable home-leandro-mozilla-firefox-<?>.default.mount
```
-->

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
$ ln -s ../dotFiles/config/zathura /home/leandro/.config/zathura
$ ln -s ../dotFiles/config/ranger /home/leandro/.config/ranger
$ ln -s ../dotFiles/config/powerline /home/leandro/.config/powerline
$ ln -s ../dotFiles/vifmrc /home/leandro/vifm/vifmrc
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

## Basic packages

config/package-lists/lmt.list.chroot
:-----------------:
aptitude
cups
expect
git
highlight
jmtpfs
nmon
pv
ranger
rsync
tree
vifm
vim
vim-airline
vim-fugitive
vim-gtk
:-----------------:

config/package-lists/multimedia.list.chroot
:-----------------:
vlc
ffmpeg
screenkey
:-----------------:

config/package-lists/siar.list.chroot
:-----------------:
gparted
lshw
udftools 
chntpw
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
