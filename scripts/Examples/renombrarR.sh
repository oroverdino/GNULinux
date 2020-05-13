#!/bin/bash

# Para la adicion de archivos:
# 7z a -pXXXXXXXX -mx=0 <file_dest>.7z <dir_origen>

# Renombrar archivos por random pero manteniendo una lista correspondiente

for f in *.exclusiones
do
    rname=$RANDOM
    echo "$f: $rname" >> lista
    mv "$f" "$rname"
done
