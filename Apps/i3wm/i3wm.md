# Configuracion de i3wm
### 191222

## Instalacion

Conviene instalar mate basico + numix theme y dejarlo lindo.
```
# aptitude install i3 i3blocks rofi compton feh
```

##Configuracion i3blocks

Primero copiamos el archivo de configuracion generado durante la instalacion
```
$ cp /etc/i3blocks.conf ~/.config/i3/i3blocks.conf
```

Los campos load1 y load2 son la carga promedio a 1min y 5min
respectivamente, luego, hay que tener dos scripts
```
# cp /usr/share/i3blocks/load_average /usr/share/i3blocks/load_average_bis
```

y en el bis hay que cambiar -f1 por -f2
```
load="$(cut -d ' ' -f2 /proc/loadavg)"
```

##Configuracion i3wm

Cargamos la letra linda para el menu y los iconos de i3blocks
```
# cp ../Apps/i3wm/fonts/* /usr/local/share/fonts/
```

y finalmente en ~/.config/i3/config la cambiamos
```
##font pango:DejaVu Sans Mono 8
font pango:System San Francisco Display 10
```

## Agregamos unos parametros a dmenu

(Si bien es una perdida de tiempo porque vamos a reemplazarlo con rofi.)
```
# start dmenu (a program launcher)
bindsym $mod+d exec dmenu_run -nb firebrick -nf white -sf white -l 3
```

Configuramos los workspaces, y hacemos que
caja siempre se abra en el workspace 4 y Firefox en el 10.

Primero debemos encontrar como nombra i3wm a la aplicacion:
```
$ xprop
``` 
copiamos la segunda etiqueta WM_CLASS(STRING)
luego lo reflejamos en ~/.config/i3/config
```
assign [class="Caja"] $workspace4
assign [class="Firefox-esr"] $workspace10
```

En ~/.config/i3/config hay que agregar al final:
```
# Startup
hide_edge_borders both
exec --no-startup-id mate-settings-daemon
exec_always feh --bg-fill ~/wallpaper.jpg
exec_always mate-power-manager
exec_always mate-terminal
# en caso de querer el applet de network-manager
exec --no-startup-id nm-applet
```

Reemplazamos i3bar por i3blocks
```
# bar
bar {
  	status_command i3blocks -c /home/leandro/.config/i3/i3blocks.conf
```

Finalmente, algunos shortcuts
```
# Screen lock
bindsym $mod+shift+x exec i3lock --color "$bg-color"

# Firefox
bindsym $mod+shift+v exec firefox

# Firefox private-window
bindsym $mod+shift+z exec firefox -private-window

# Screenshot 
bindsym $mod+Print exec "mate-screenshot -a"
```
