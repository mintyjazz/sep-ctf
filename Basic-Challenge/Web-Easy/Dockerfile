FROM ubuntu:20.04

RUN apt-get update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y apache2

WORKDIR var/www/html

COPY index.html index.html
COPY checkans.js checkans.js

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]