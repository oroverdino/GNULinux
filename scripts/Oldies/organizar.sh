#!/bin/sh

# Este script est'a en el mismo directorio que los cap (Friends)
# y la carpeta 'spanish' que es la que tiene todos los subit'itulos
# bajados de OpenSubtitle en formato zip.
#
# Hacemos un for para los cap 22,23,24 y 25
for i in 22 23 24 25
do
    # descomprimimos el zip del cap y creamos la carpeta correspondiente
	ls spanish/*06.e${i}* | xargs 7z e -o${i}
	# ahora movemos el cap a la carpeta
	mv friends*06e${i}* ./${i}/
	# confirmamos
	echo listo con el cap${i}
done

echo "Terminado"