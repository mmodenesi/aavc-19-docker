## Dockerfile para los labs de AAVC19

- python 3.6.8
- opencv 4.4.1
- matplotlib
- numpy
- scipy

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
