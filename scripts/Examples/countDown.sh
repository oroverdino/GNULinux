#!/bin/bash

if [ $# -lt 1 ]
then
    echo "Time needed in seconds"
    echo "Usage: $0 <seconds>"
    echo "Example: $0 10"
    exit 1
fi

time="$1"
bell="/home/leandro/Documents/GNULinux/scripts/Examples/bell.wav"
#start="$(date +%s)"
start="$SECONDS"
s=1

function main(){
    echo "Welcome..."
    while [ $s -gt 0 ]
    do
        s="$((time - (SECONDS - start)))"
        echo -ne "\r              \r" # evitamos una nueva linea
        echo -ne "\r$s seconds left"
        sleep 1
    done
    echo -e "\nLesto" 
    # checamos si existe bell.wav
    if [ -f "$bell" ]
    then
        # reproducimos la campana y evitamos el texto info
        aplay "$bell" 2>/dev/null
    else
        speaker-test
    fi
    exit 0
}

main
