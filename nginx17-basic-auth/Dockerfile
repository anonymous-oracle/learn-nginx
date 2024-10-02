FROM nginx
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install vim htop procps apt-transport-https build-essential net-tools iputils-ping
RUN apt-get -y install ca-certificates curl vim software-properties-common dnsutils tcpdump 
RUN apt-get -y install apache2-dev httpd
# RUN apt-get -y install nginx
RUN apt-get -y upgrade
RUN set -o vi
RUN mkdir -p /var/www/websites
COPY ./websites /var/www/websites
RUN cp -r /etc/nginx/conf.d /etc/nginx/conf.d.bak
COPY ./conf.d /etc/nginx/conf.d
# RUN htpasswd -c /etc/nginx/.htpasswd
COPY .htpasswd /etc/nginx/.htpasswd
EXPOSE 80/tcp
