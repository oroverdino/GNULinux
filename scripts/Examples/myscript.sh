#!/bin/sh

clear
echo -n "Enter your name: "
read name

clear
if [ "$name" = "leandro" ]
then
    echo "bue, idiota" | pv -qL 9
elif [ "Sname" = "torres" ]
then
    echo "bue, seguis siendo un idiota"
else
    echo "how the hell are you?" | pv -qL 9
fi
