# Configuracion de i3wm
### 200107

## Instalacion

Conviene instalar mate basico + numix theme y dejarlo lindo.
```
# aptitude install i3 i3blocks rofi compton feh
```

## Configuracion i3wm

Primero copiamos el archivo de configuracion desde el repo
```
$ cp ../Apps/i3wm/i3/config.t430 ~/.config/i3/config
``` 

Cargamos la letra linda para el menu y los iconos de i3blocks
```
# ln -s ../dotFiles/fonts /usr/local/share/fonts
```

## Configuracion i3blocks

Primero copiamos el archivo de configuracion desde el repo
```
$ cp ../Apps/i3wm/i3/i3blocks.conf.t430 ~/.config/i3/i3blocks.conf
```

Luego los scripts necesarios
```
# rsync -avh --delete ../Apps/i3wm/i3blocks/ /usr/share/i3blocks/
```

Para que calendar funcione (esto es, notify-send) instalar
```
# aptitude install libnotify-bin
```

## Configuraciones extras

Configuramos los workspaces, y hacemos que caja siempre se abra
en el workspace 4

Primero debemos encontrar como nombra i3wm a la aplicacion:
```
$ xprop
``` 
copiamos la segunda etiqueta WM_CLASS(STRING)
luego lo reflejamos en ~/.config/i3/config
```
assign [class="Caja"] $workspace4
```
