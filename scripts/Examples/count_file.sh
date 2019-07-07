#!/bin/bash

D="$(ls -aRlh | wc -l)"
C="$(ls -aRlh ./Cache | wc -l)"
DELTA=`expr $D - $C`
echo "${DELTA}" >> /tmp/cacheDeGoogle.dat
echo '----- 10seg -----' >> /tmp/cacheDeGoogle.dat
