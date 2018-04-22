#!/bin/sh

# debe ejecutarse como root, yo lo dejo en /root

sync ; echo 3 >/proc/sys/vm/drop_caches
