# Driver para mi Genius EasyPen i405X

Funciona con wizardpen, que esta disponible en:
[wizardpen](https://digimend.github.io/support/howto/drivers/wizardpen/)

## Instalar el driver
```
# cd Desktop
# wget https://launchpad.net/~doctormo/+archive/xorg-wizardpen/+files/xserver-xorg-input-wizardpen_0.8.1-0ubuntu3.tar.gz
```

Para compilarlo primero hay que instalar algunas dependencias. No son todas
necesarias, pero por si acaso
```
# apt-get install build-essential xutils-dev xutils
# apt-get install libx11-dev libxext-dev xautomation xinput
# apt-get install xserver-xorg-dev autoconf libtool pkg-config
# tar xvzf xserver-xorg-input-wizardpen_0.8.1-0ubuntu3.tar.gz
# cd xserver-xorg-input-wizardpen-0.8.1
# ./autogen.sh --prefix=/usr
# make
# make install
```
a mi no me salto ningun error, todo fue de perillas

## Configuracion
Una vez instalado, tuve que crear el archivo de configuracion
para mi tableta
```
# mkdir /etc/X11/xorg.conf.d
# nano /etc/X11/xorg.conf.d/52-tablet.conf
```
y ahi dentro
```
- Section "InputClass"
-    Identifier "UC-Logic tablet"
-    MatchIsTablet "on"
-    MatchProduct "UC-LOGIC|H850S"
-    MatchDevicePath "/dev/input/event*"
-    Driver "wizardpen"
-    # Apply custom Options below.
-    Option      "TopZ"      "50"   # umbral min de presion
-    Option      "TopX"      "100"
-    Option      "TopY"      "100"
-    Option      "BottomZ"   "1024" # tope de presion, creo
-    Option      "BottomX"   "xxxx"
-    Option      "BottomY"   "xxxx"
- EndSection
```
