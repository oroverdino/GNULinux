# Configuracion de grub2
### 170905

## Splash image

### Jessie

Para cambiar el fondo del grub2 hay que sobreescribir la imagen
por defecto por la que se quiera.
```
$ sudo cp debian-grub.png /usr/share/image/desktop-base/lines-grub.png
```

### Stretch

En stretch cambia un poco. Primero sobreescribimos
```
$ sudo cp debian-grub.png /usr/share/desktop-base/active-theme/grub/grub-4x3.png
```

Y despues modificamos el sh que esta en ese mismo directorio; debe quedar:
```
WALLPAPER=/usr/share/images/desktop-base/desktop-grub.png
COLOR_NORMAL=white/black
COLOR_HIGHLIGHT=white/black
```

Finalmente, `$ sudo update-grub`
