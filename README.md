# docker image for dotNet
![angular](https://img.shields.io/badge/.NETCore-5.0-0078d6?style=flat-square&logo=windows)   ![angular](https://img.shields.io/badge/Debian-10(buster)-a81d33?style=flat-square&logo=Debian)

Versión 11.08.2021

Documento léeme

------

Copyright (C) 2021.

- Héctor Orlando, hcrispens
  hector.or.cr@gmail.com

![docker](images/docker.svg)               ![dotnet](images/dotnet48.svg)



------


- [docker image for dotNet](#docker-image-for-dotnet)
  - [Descripción](#descripción)
  - [Instalación de docker en linux](#instalación-de-docker-en-linux)
  - [Compilar esta imagen](#compilar-esta-imagen)
  - [Descargar la imagen de docker hub](#descargar-la-imagen-de-docker-hub)
  - [Construyendo un contenedor](#construyendo-un-contenedor)
  - [Licencia](#licencia)
    - [GNU General Public License](#gnu-general-public-license)
------



## Descripción

**Docker** es un proyecto de [código abierto](https://es.wikipedia.org/wiki/Código_abierto) que automatiza el despliegue de [aplicaciones](https://es.wikipedia.org/wiki/Aplicación_informática) dentro de [contenedores de software](https://es.wikipedia.org/wiki/Contenedores_de_software), proporcionando una capa adicional de abstracción y automatización de  virtualización de aplicaciones en múltiples sistemas operativos.

Para el desarrollo de aplicaciones utilizando contenedores, se debe generar una imagen la cual se hace a traves de un documento **Dockerfile**

Esta imagen esta construida con la base de Debian 10 (Buster) e incorpora el SDK de .NET Core 5.0 para el desarrollo de aplicaciones en .Net.

------



## Instalación de docker en linux

Remover versiones anteriores de la aplicación

```bash
$ sudo apt-get remove docker docker-engine docker.io containerd runc
```



Instalar usando el repositorio

```bash
$ sudo apt-get update
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```



Agregar la clave del repositorio GPG key:

```bash
$ curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```



Agregar Docker al sources.list

```bash
$ echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```



Por último actualizar e instalar docker 

```bash
$ sudo apt-get update

$ sudo apt-get install docker-ce docker-ce-cli containerd.io
```

------



## Compilar esta imagen

El proyecto cuenta con un documento Dockerfile denominado `dotnet.Dockerfile` el cual toma la base de debian 10 e instala el .Net Core 5.0.

Clone primero el proyecto utilizando git:

```bash
$ git clone https://github.com/hectorcrispens/dotNet.git

$ cd dotNet/
```

Para compilar la imagen utilice el siguiente comando:

```bash
$ docker build -t dotnet -f dotnet.Dockerfile .
```

------



## Descargar la imagen de docker hub

También puede descargar la image ya construida desde [docker hub](https://hub.docker.com/)

```bash
$ docker pull hectorcrispens/dotnet:latest
```

------



## Construyendo un contenedor

La opción mas sencilla para ver como funciona es utilizar la siguiente linea para crear un contenedor que muestra las opciones de dotnet, y luego de eso se elimina automáticamente.

```bash
$ docker run -it --rm dotnet:latest "dotnet -h"
```

------



## Licencia

Copyright (C) 2021.

- Héctor Orlando, hcrispens
  hector.or.cr@gmail.com

### GNU General Public License

La Licencia Pública General de GNU o más conocida por su nombre en inglés GNU General Public License (o simplemente sus siglas en inglés GNU GPL) es una licencia de derecho de autor ampliamente usada en el mundo del software libre y código abierto,6 y garantiza a los usuarios finales (personas, organizaciones, compañías) la libertad de usar, estudiar, compartir (copiar) y modificar el software. 

Su propósito es doble: declarar que el software cubierto por esta licencia es libre, y protegerlo (mediante una práctica conocida como copyleft) de intentos de apropiación que restrinjan esas libertades a nuevos usuarios cada vez que la obra es distribuida, modificada o ampliada. 

Debería haber recibido una copia de la Licencia Pública General GNU junto con
este programa, en LICENSE.md o <https://www.gnu.org/licenses/gpl-3.0.html.en>.
