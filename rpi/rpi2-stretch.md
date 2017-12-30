### Actualizacion de raspian jessie a stretch
### 170709

# Instalacion

En la pagina de raspberry todavia tienen el raspian corriendo en jessie.

Baje la imagen de todos modos y la mande a la uSD.

Para el primer booteo conecte la rpi2 con:
- HDMI
- teclado genius
- dongle wifi TP-Link
- alimentacion

# Configuracion

Lo primero que hay que saber y que es muy dificil enterarse es:
- user: pi
- pass: raspberry

Luego hay que configurarlo como ellos quieren
```
$ sudo raspi-config
```

Las modificaciones basicas son:
- bootear solo desde la consola
- cambiar el pass por: rpi2
- habilitar el servicio ssh
- ocupar toda la memoria SD

## Dongle TL-WN725N

No hubo que instalar el firmware del dongle, solo configurar la red.

Para tal fin hay agregar en /etc/network/interfaces 
```
auto wlan0 
iface wlan0 inet dhcp 
    wpa-ssid {ssid} 
    wpa-psk {password}
```

Por ejemplo:
```
auto wlan0 
iface wlan0 inet dhcp 
    wpa-ssid Municipio06
    wpa-psk wifiBarrio48
```

### eth0

Una alternativa cuando no se dispone mas que de una PC para entrar
por ssh, puede ser agregando en /etc/network/interfaces
```
auto eth0
iface eth0 inet static
    address 192.168.9.9
    netmask 255.255.255.0
```

> No se si va a funcionar

# Stretch

Hasta ahora todo era en jessie, conviene hacer el upgrade a Stretch
antes de ponerlo bonito (powerline, vim, etc)
