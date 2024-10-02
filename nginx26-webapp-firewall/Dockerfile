FROM nginx
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install vim htop procps apt-transport-https build-essential net-tools iputils-ping git
RUN apt-get -y install ca-certificates curl vim software-properties-common dnsutils tcpdump wget
RUN apt-get -y install make gcc libpcre3 libpcre3-dev zlib1g-dev libssl-dev g++ openssl zlib1g
RUN apt-get -y install libxml2 libxml2-dev libxslt1-dev libgd-dev libgeoip-dev libperl-dev unzip
RUN apt-get -y upgrade
RUN set -o vi
RUN mkdir -p /var/www/websites
COPY ./websites /var/www/websites

WORKDIR /
RUN wget https://nginx.org/download/nginx-1.27.1.tar.gz
RUN tar xvf nginx-1.27.1.tar.gz
RUN rm nginx-1.27.1.tar*
RUN mkdir -p /naxsi-master
# this will pull all the run through the submodules as well
RUN git clone --recurse-submodules https://github.com/wargio/naxsi.git /naxsi-master
COPY ./nginx-configure.sh /nginx-1.27.1/nginx-configure.sh
RUN chmod +x /nginx-1.27.1/nginx-configure.sh
WORKDIR /nginx-1.27.1
RUN /nginx-1.27.1/nginx-configure.sh
RUN MAKEFLAGS=-j4 make
RUN MAKEFLAGS=-j4 make install
RUN cp -r /etc/nginx/conf.d /etc/nginx/conf.d.bak
RUN cp -r /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./conf.d /etc/nginx/conf.d
COPY /naxsi-master/naxsi_config/naxsi_core.rules /etc/nginx/naxsi_core.rules
COPY ./naxsi.rules /etc/nginx/naxsi.rules
RUN echo "Access Denied" > /var/www/websites/deniedUrl.txt
RUN service nginx restart
EXPOSE 80/tcp
