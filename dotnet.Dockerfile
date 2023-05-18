FROM debian:stable-slim

# Pre requisitos
RUN apt-get update
RUN apt-get update && apt-get install -y wget && apt-get install -y git

# Instalacion del repositorio de microsoft
RUN wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

# Instalacion del SDK
RUN apt-get update; \
  apt-get install -y apt-transport-https && \
  apt-get update && \
  apt-get install -y dotnet-sdk-6.0

# Gestion de tools
WORKDIR /home
RUN dotnet new tool-manifest
COPY dotnet-tools.json .config/dotnet-tools.json
#RUN dotnet tool restore

# Gestion de Script de inicio
COPY dotstart.sh /usr/local/bin/dotstart

# Gestion de usuario
ARG USER=dotuser
ARG PW=dotuser

RUN groupadd ${USER}
RUN useradd ${USER} -g ${USER}

RUN chpasswd "${USER}:${PW}"


WORKDIR /home/dotnet

ENTRYPOINT ["/bin/sh", "-c"]

CMD [ "dotstart" ]
