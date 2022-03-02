# Cryptsetup
### 210916

## Instalacion
```
$ sudo aptitude install cryptsetup
```

## Procedimiento
Supongamos que queremos encriptar una unidad /dev/sdb1, la variable carry es
efimera; el label de la particion es rohs. Entonces:
```
# crpytsetup --verify-passphrase luksFormat /dev/sdb1
# crpytsetup open /dev/sdxi carry
# mkfs.ext4 -L rohs /dev/mapper/carry
# mount /dev/mapper/carry /mnt
...
# umount /mnt
# crpytsetup close carry
```

Para crear un archivo de 8G como si fuera una unidad:
```
$ dd if=/dev/null of=meteorito bs=1 seek=8G
# cryptsetup --verify-passphrase luksFormat meteorito
# crpytsetup luksOpen meteorito rohs
# dd if=/dev/zero of=/dev/mapper/rohs
# mkfs.ext4 -L meteorito /dev/mapper/rohs
```

## Montar
```
# crpytsetup open /dev/sdxi carry
# mount /dev/mapper/carry /mnt
...
# umount /mnt
# crpytsetup close carry
```

## Agregar una passphrase
Luego de crear la unidad encriptada, desmontada, hacemos:
```
# cryptsetup luksAddKey /dev/sdb1
```

