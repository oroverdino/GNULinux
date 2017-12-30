### Google Chrome en Debian

# Install via PPA

```
$ wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
```

Crear el archivo /etc/apt/source.list.d/google-chrome.list apuntando al repositorio
de Google:
```
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
```

Finalmente instalar el estable
```
$ sudo apt update
$ sudo apt install google-chrome-stable
```

# Repositorios de Google

Google tiene software en paquetes .deb directamente:
[Linux Software Repositories](https://www.google.com/linuxrepositories/)

Primero hay que instalar un paquete para la integracion con el menu
```
# aptitude install libappindicator1
```
