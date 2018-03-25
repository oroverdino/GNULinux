# Backup con rsync
### 180325

## Preparacion

Primero montamos el disco donde vamos a hacer el backup:
```
$ sudo fdisk -l
$ sudo mount /dev/sdb1 /mnt
```

Vaciamos la papelera.

## Backup Debian

El backup lo hacemos en cinco partes:

	/home
excepto:
	~/Descargas
	~/.cache
	~/.mozilla

	/var
excepto
	/var/cache
	/var/run
	/var/tmp

	/etc

	/usr/local

	/opt

Para eso est'an los archivos <dir>.exclusiones; entonces
```
$ rsync -aXAvuhP --exclude-from '<dir>.exclusiones' --delete <origen> <destino>
```
