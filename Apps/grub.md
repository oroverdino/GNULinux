# Configuracion de grub2
### 180101

## Grub splash image

The thing is simple but tricky. The image shold be 16:9 or 4:3, depends on your
monitor's resolution; so the type:
* PNG, 8-bit/color RGBA, non-interlaced

The options configuration it's in: 
* /usr/share/desktop-base/active-theme/grub/grub_background.sh

There we could change the direction of the grub's wallpaper. But, if you wish
to be tidy take in mind that the item WALLPAPER it's a link to another link to
the real png file. So
> /usr/share/images/desktop-base/desktop-grub.png
points to
> /etc/alternatives/desktop-grub
wich points to
> /usr/share/desktop-base/active-theme/grub/grub-4x3.png

In this last directory there's anther png file, grub-16x9.png. In order you
should copy here your png file, delete the second link and create a new one
who points to your png (or grub-16x3.png).
```
$ sudo cp debian.png /usr/share/desktop-base/active-theme/grub/
$ sudo rm /etc/alternatives/desktop-grub
$ sudo ln -s /usr/share/desktop-base/active-theme/grub/debian.png
    /etc/alternatives/desktop-grub
$ sudo update-grub
```

### update debian buster
```
$ sudo exec /usr/sbin/grub-mkconfig -o /boot/grub/grub.cfg "$@"
```

## Lightdm splash image

It's really nice if you use the same png file for the background of your login.

To do that you must modify
* /etc/lightdm/lightdm-greeter-conf

```
...
[greeter]
background=/usr/share/desktop-base/active-theme/grub/debian.png
theme-name=Numix
icon-theme-name=Numix
...
```
