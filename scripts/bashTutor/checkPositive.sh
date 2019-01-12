#!/bin/bash
#
# Script to see whether argument is positive
# using mathematical operator gt

if test $1 -gt 0; then
    echo "$1 number is positive"
fi

# same can be written without test:
if [ $1 -lt 0 ]; then
    echo "$1 number is negative"
fi
