## Dockerfile para el primer lab de AAVC19

- python 3.6.8
- opencv 4.4.1
- matplotlib >=3.1.1
- numpy >=1.17.2
- scipy >=1.3.1
- pandoc y texlive (para exportar en formato pdf)

### build

```console
docker build --tag opencv:4.1.1 .
```

### run

Reemplazar `$(pwd)` con el path absoluto al directorio que contiene los archivos que quiero editar
(o un directorio vacío, en todo caso). Los archivos modificados / creados en el contenedor se "ven"
en ese directorio del host.

```console
docker run \
    --name aavc19 \
    --publish 8888:8888 \
    --volume $(pwd):/workspace \
    opencv:4.1.1
```
