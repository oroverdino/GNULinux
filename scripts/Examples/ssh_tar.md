# En este eg traigo de una pc remota un directorio _pack_
```
$ ssh leandro@192.168.89.62 'cd /home/leandro/.vim && tar -cf - pack' > pack.tar
```

# Claro que se puede copiar
```
$ ssh leandro@192.168.89.62 'cat /home/leandro/.Xresources' > .Xresources
```
