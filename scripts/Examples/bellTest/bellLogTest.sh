#!/bin/bash

# mandamos un msj a systemd
echo "The bell had sound" | systemd-cat -t testBell
# for check run as root: journal -t testBell
