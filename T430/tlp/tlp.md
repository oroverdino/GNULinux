# Instalacion modulo tlp Thinkpad T430
### 171029

# Problema resuelto en stretch con kernel 4.13

1. instalar tlp tlp-rdw desde apt
2. instalar dkms desde apt
3. instalar acpi-call-dkms_1.1.0-4_all.deb mediante dpkg

# Notas

El problema es que tp-smapi no soporta la tecnologia de T430, asi que hay
que hacerlo con acpi-call. Pero el modulo que esta en el repositorio actual
de debian no es compatible con el nuevo kernel, 4.13.

La solucion fue bajar el modulo acpi-cal-dkms desde el repositorio de buster.

### 171208

Instale buster y los pasos 1, 2; el 3 lo instale derecho y todo anda
