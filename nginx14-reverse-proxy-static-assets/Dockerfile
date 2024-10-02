FROM nginx
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install vim htop procps apt-transport-https build-essential net-tools iputils-ping
RUN apt-get -y install ca-certificates curl vim software-properties-common dnsutils 
# RUN apt-get -y install nginx
RUN apt-get -y upgrade
RUN mkdir -p /var/www/assets
COPY ./assets /var/www/assets
RUN cp -r /etc/nginx/conf.d /etc/nginx/conf.d.bak
COPY ./conf.d-reverseproxy /etc/nginx/conf.d
RUN set -o vi

EXPOSE 80/tcp