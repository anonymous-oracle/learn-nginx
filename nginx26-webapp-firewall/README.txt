./configure --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --pid-path=/var/run/nginx.pid --user=nginx --group=nginx --with-http_ssl_module --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_stub_status_module --with-mail --with-mail_ssl_module --with-ipv6 --with-cc-opt='-O3 -g -pipe -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic' --with-http_geoip_module --with-http_image_filter_module --with-http_xslt_module --with-http_perl_module

naxsi package
https://github.com/nbs-system/naxsi/archive/master.zip

nginx version package
https://nginx.org/download/nginx-1.27.1.tar.gz


Test naxsi webapp

- after the route uri ends with /, add ?a=%3C