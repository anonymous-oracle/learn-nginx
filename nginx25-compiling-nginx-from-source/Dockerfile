FROM nginx
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install vim htop procps apt-transport-https build-essential net-tools iputils-ping 
RUN apt-get -y install ca-certificates curl vim software-properties-common dnsutils tcpdump wget
RUN apt-get -y install make gcc libpcre3 libpcre3-dev zlib1g-dev libssl-dev g++ openssl zlib1g
RUN apt-get -y install libxml2 libxml2-dev libxslt1-dev libgd-dev libgeoip-dev libperl-dev
RUN apt-get -y upgrade
RUN set -o vi
RUN mkdir -p /var/www/websites
COPY ./websites /var/www/websites
COPY ./nginx-1.27.1.tar /
RUN tar xvf nginx-1.27.1.tar
COPY ./nginx-configure.sh /nginx-1.27.1/nginx-configure.sh
RUN chmod +x /nginx-1.27.1/nginx-configure.sh
WORKDIR /nginx-1.27.1
RUN /nginx-1.27.1/nginx-configure.sh
RUN MAKEFLAGS=-j4 make
RUN MAKEFLAGS=-j4 make install
# RUN cp -r /etc/nginx/conf.d /etc/nginx/conf.d.bak
# RUN cp -r /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./conf.d /etc/nginx/conf.d
# RUN wget -O /etc/init.d/nginx https://gist.github.com/sairam/5892520/raw/b8195a71e944d46271c8a49f2717f70bcd04bf1a/etc-init.d-nginx
# RUN chmod +x /etc/init.d/nginx
RUN service nginx restart
EXPOSE 80/tcp
