# Instalacion Powerline

## Powerline desde repositorio

Segui las instrucciones de un tal [tiox](https://ubuntu-mate.community/t/installing-powerline-as-quickly-as-possible/5381).

Hace una introducci'on que me dio confianza:
```
$ sudo aptitude install powerline
```
eso es todo.

### Shell

Hay que agregar al final de /etc/bash.bashrc (para tal fin dej'e un archivo,
bash.bashrc.tail)
```
# Powerline
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
    source /usr/share/powerline/bindings/bash/powerline.sh
fi

# Caps por Escape
setxkbmap -option caps:escape
```

### Vim

Sigue sin funcionar en vim

### Personalizacion

En el archivo '/usr/share/powerline/config-files/colorscheme/default.json' se pueden cambiar los colores.

## Desde git

Desde el repositorio no pude configurar powerline para vim. Pero segui las instrucciones de
[levlaz](https://levlaz.org/installing-powerline-in-debian/)

Las instrucciones estan dadas para python2.7, yo estoy con el python3.5.

```
$ sudo apt install vim-nox git python3-pip
$ sudo pip3 install git+git://github.com/Lokaltog/powerline
```

Instalamos las fuentes
```
$ wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf 
$ wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf 
$ sudo mv PowerlineSymbols.otf /usr/share/fonts/ 
$ sudo fc-cache -vf 
$ sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
```

### Shell

Al final de /etc/bash.bashrc hay que agregar
```
# Powerline
if [ -f /usr/local/lib/python3.5/dist-packages/powerline/bindings/bash/powerline.sh ]; then
     source /usr/local/lib/python3.5/dist-packages/powerline/bindings/bash/powerline.sh
fi
```

### Vim

Al final de ~/.vimrc hay que agregar
```
" Powerline
set rtp+=/usr/local/lib/python3.5/dist-packages/powerline/bindings/vim/
```

### Personalizacion para mi Thinkpad

No es necesario eliminar los atributos bold, eso desde la configuracion del terminal.

Para cambiar los colores hay que sobreescribir los archivos config.json y colors.json que estan dentro de:
```
/usr/local/lib/python3.5/dist-packages/powerline/config_files/
```
y copiar el archivo thinkpad.json en colorscheme, y vim_thinkpad.json en colorscheme/vim/thinkpad.json

Si no se disponen de los archivos config.json y colors.json hay que agregar en colors.json
```
"punto": [1, "fb0206"],
"letra": [7, "d4d4d6"],
"fondo": [0, "323234"]
```
y en config.json hay que cambiar _default_ por _thinkpad_ en las configuraciones de
bash y de vim.

Dentro de .../config-files/ van los archivos colors.json y config.json

Dentro de .../colorschemes/ va thinkpad.json y dentro del directorio vim
va vim_thinkpad.json (renombrado thinkpad.json).
