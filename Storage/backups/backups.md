# Notas sobre backups
### 180325

## Preparacion

Lo primero que tuve que considerar es que estaba por utilizar un disco
de 2.5" que tuve que cambiar por tener fallas.

Para hacer uso de una herramienta que marca los sectores defectuosos tenia
que usar ext2, ext3 o ext4.

Con el gparted formateo en ext4. Luego me aseguro que sea sdb1
```
# fdisk -l
```

Nos aseguramos que el dispositivo no este montado
```
# umount /dev/sdb1
```

el proceso tarda unas 3hs para un disco de 500GB
```
# e2fsck -pcv /dev/sdb1
```

## Backup Debian

Montamos las particiones necesarias
```
# mount /dev/sdb1 /mnt
```

Vaciamos la papelera y hacemos un backup en cinco partes:

    /home
    excepto
        /home/leandro/Descargas
        /home/leandro/.cache
        /home/leandro/.mozilla
        /home/leandro/Vídeos
    
    /var
    excepto
        /var/cache
        /var/run
        /var/tmp
    
    /etc
    
    /usr/local
    
    /opt

Para eso tenemos los archivos <dir>.exclusiones
```
# rsync -aXAvhuP --exclude-from '<dir>.exclusiones' --delete <dir> <destino>
```

Considerar tambien esta linea:
```
rsync -aAXP --info=progress2 --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / /path/to/backup/folder
```

### Importante

El slash indica si se copia el directorio entero
o solo su contenido, por ejemplo:
```
# rsync -a /home/ /mnt/BACKUPS/Debian
```
va a resultar en:
- /mnt/BACKUPS/Debian/leandro/etc etc
mientras que
```
# rsync -a /home /mnt/BACKUPS/Debian
```
resultara en
- /mnt/BACKUPS/Debian/home/leandro/etc etc
