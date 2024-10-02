FROM nginx
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install vim htop procps apt-transport-https build-essential net-tools iputils-ping
RUN apt-get -y install ca-certificates curl vim software-properties-common dnsutils tcpdump 
RUN apt-get -y upgrade
RUN set -o vi
RUN mkdir -p /var/www/websites
COPY ./websites /var/www/websites
RUN cp -r /etc/nginx/conf.d /etc/nginx/conf.d.bak
RUN cp -r /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./conf.d /etc/nginx/conf.d
RUN mkdir -p /etc/nginx/ssl
COPY ./example.key /etc/nginx/ssl/example.key
COPY ./example.cert /etc/nginx/ssl/example.cert
EXPOSE 80/tcp
EXPOSE 443
