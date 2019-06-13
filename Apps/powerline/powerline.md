# Instalacion Powerline

## Powerline desde repositorio

Segui las instrucciones de un tal [tiox](https://ubuntu-mate.community/t/installing-powerline-as-quickly-as-possible/5381).

Hace una introducci'on que me dio confianza:
```
$ sudo aptitude install powerline
```
eso es todo.

Actualizacion: desde Buster conviene instalar Airline para vim y un aditivo
para las carpetas de la shell con git:
```
# aptitude install vim-airline powerline-gitstatus
```

### Shell

Hay que agregar al final de /etc/bash.bashrc (para tal fin dej'e un archivo,
bash.bashrc.tail)
```
# Powerline
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
    source /usr/share/powerline/bindings/bash/powerline.sh
fi
```
### Personalizacion

En el archivo '/usr/share/powerline/config-files/colorscheme/default.json'
se pueden cambiar los colores.

### Personalizacion para mi Thinkpad

No es necesario eliminar los atributos bold, eso desde la configuracion del
terminal, en el mismo sentido cambiar capsLock por Esc se hace desde la
configuracion del teclado.

Para cambiar los colores hay que modificar los archivos config.json y
colors.json que estan dentro de:
```
/usr/share/powerline/config-files/
```
y copiar el archivo thinkpad.json en colorscheme/

Hay que agregar en colors.json (en Apps/powerline/ hay una copia):
```
"punto": [1, "fb0206"],
"letra": [7, "d4d4d6"],
"fondo": [0, "323234"]
```
y en config.json hay que cambiar _default_ por _thinkpad_ en las
configuraciones de shell

En resumen:
1. Sobreescribir colors.json y config.json con los archivos de Apps/powerline
2. Dentro de .../colorschemes/ va thinkpad.json
