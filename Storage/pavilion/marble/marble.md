# Configuracion Logitech Marble
### 161115

## Configuracion

La documentacion la encontramos en [x.org] (https://www.x.org/archive//X11R7.0/doc/html/mouse.4.html).

Hay que crear un archivo de configuracion para que tome las
caracteristicas que se desean
```
# vim /usr/share/X11/xorg.conf.d/50-marblemouse.conf
```

Mi configuracion es

> 1: big left
> 3: big right
> 8: small left
> 9: small right

> scroll: mantener presionado 3
> lock press left: 9

```
Section "InputClass"
    Identifier      "Marble Mouse"
    MatchProduct    "Logitech USB Trackball"
    MatchIsPointer  "on"
    MatchDevicePath "/dev/input/event*"
    Driver          "evdev"
    Option          "SendCoreEvents" "true"

    Option "Buttons"            "9"
    Option "ButtonMapping"      "1 8 3 4 5 6 7 2 9"
    Option "EmulateWheel"       "true"
    Option "EmulateWheelButton" "3"
    Option "DragLockButtons"	"9 1"
    Option "YAxisMapping"       "4 5"
    Option "XAxisMapping"       "6 7"
EndSection
```
