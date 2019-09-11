## Dockerfile para los labs de AAVC19

### build

```console
docker build --name opencv:4.1.1 .
```

### run

(reemplazar el texto entre `<` y `>`) con el path absoluto al directorio que contiene los archivos
que quiero editar (o un directorio vacío, en todo caso). Los archivos modificados / creados en el
contenedor se "ven" en ese directorio del host.

```console
docker run \
    --name aavc19 \
    --publish 8888:8888 \
    --volume <directorio donde tengo los archivos del lab>:/workspace` \
    opencv:4.1.1
```
