FROM nginx
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install vim htop procps apt-transport-https build-essential net-tools iputils-ping
RUN apt-get -y install ca-certificates curl vim software-properties-common dnsutils tcpdump 
RUN apt-get -y install apache2-dev
RUN apt-get -y install apache2 apache2-utils 
RUN apt-get -y install libpcre3-dev zlib1g-dev libssl-dev libxml2-dev libxslt-dev libgd-dev wget
RUN apt-get update
RUN apt update
RUN apt-get -y install geoip-bin geoip-database libgeoip-dev libgeoip1 libmaxminddb0 libmaxminddb-dev mmdb-bin
# RUN apt-get -y install nginx-plus-module-geoip2
# WORKDIR /
# RUN wget https://github.com/leev/ngx_http_geoip2_module/archive/refs/tags/3.3.tar.gz
# RUN tar xvfz 3.3.tar.gz
# RUN wget https://nginx.org/download/nginx-1.27.1.tar.gz
# RUN tar xvfz nginx-1.27.1.tar.gz
# WORKDIR /nginx-1.27.1

# RUN ./configure --add-dynamic-module=./ngx_http_geoip2_module-3.3 --with-cc-opt='-g -O2 -fdebug-prefix-map=/build/nginx-KTLRnK/nginx-1.27.1=. -fstack-protector-strong -Wformat -Werror=format-security -fPIC -Wdate-time -D_FORTIFY_SOURCE=2' --with-ld-opt='-Wl,-Bsymbolic-functions -Wl,-z,relro -Wl,-z,now -fPIC' --prefix=/usr/share/nginx --conf-path=/etc/nginx/nginx.conf --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log --lock-path=/var/lock/nginx.lock --pid-path=/run/nginx.pid --modules-path=/usr/lib/nginx/modules --http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-proxy-temp-path=/var/lib/nginx/proxy --http-scgi-temp-path=/var/lib/nginx/scgi --http-uwsgi-temp-path=/var/lib/nginx/uwsgi --with-debug --with-compat --with-pcre-jit --with-http_ssl_module --with-http_stub_status_module --with-http_realip_module --with-http_auth_request_module --with-http_v2_module --with-http_dav_module --with-http_slice_module --with-threads --with-http_addition_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_image_filter_module=dynamic --with-http_sub_module --with-http_xslt_module=dynamic --with-stream=dynamic --with-stream_ssl_module --with-mail=dynamic --with-mail_ssl_module
# RUN make modules
RUN apt-get -y upgrade
RUN set -o vi
RUN mkdir -p /var/www/websites
COPY ./websites /var/www/websites
RUN cp -r /etc/nginx/conf.d /etc/nginx/conf.d.bak
RUN cp -r /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./conf.d /etc/nginx/conf.d

EXPOSE 80/tcp
