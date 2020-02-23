# Cryptsetup
### 200210

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
