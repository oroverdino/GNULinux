echo "using expresion with if"

if [ -f mytext.txt ]; then
    echo "You have mytext.txt. Things are fine."
else
    echo "Yikes"
fi

echo "using test command"

if test -f mytext.txt
then
    echo "Awesome! You have a mytest.txt"
else
    echo "Oh, snap!"
fi
