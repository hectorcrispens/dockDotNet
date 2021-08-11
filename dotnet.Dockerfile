FROM debian:stable-slim

RUN apt-get update
RUN apt-get install -y wget && git

RUN wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

RUN apt-get update; \
  apt-get install -y apt-transport-https && \
  apt-get update && \
  apt-get install -y dotnet-sdk-5.0

WORKDIR /home/dotnet

ENTRYPOINT ["/bin/sh", "-c"]

