#!/bin/sh

# Este script convierte un arch markdown para ver en w3m

pandoc "$1" | w3m -T text/html
