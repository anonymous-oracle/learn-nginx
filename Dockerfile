FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y upgrade && apt-get -y install build-essential vim htop procps apt-transport-https ca-certificates curl vim software-properties-common dnsutils
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/docker.gpg
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update && apt-get -y install docker-ce
RUN apt-get update
# RUN apt-get install -y git libffi-dev openssl gcc libc-dev make
# RUN apt install -y python3-pip python3-full
# RUN pip install docker-compose
# Avoid warnings by switching to noninteractive


# Install systemd
RUN apt-get update && apt-get install -y systemd systemd-sysv && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt update

# Remove unnecessary systemd services to reduce image size and improve boot time
RUN find /etc/systemd/system \
         /lib/systemd/system \
         -path '*.wants/*' \
         -not -name '*journald*' \
         -not -name '*systemd-tmpfiles-setup*' \
         -not -name '*systemd-user-sessions*' \
         -delete
# Mask services that do not work in a container
RUN systemctl mask \
    dev-hugepages.mount \
    sys-fs-fuse-connections.mount \
    sys-kernel-config.mount \
    sys-kernel-debug.mount \
    display-manager.service \
    getty@.service \
    systemd-logind.service \
    systemd-remount-fs.service \
    getty.target \
    graphical.target


VOLUME [ "/var/lib/docker" ]

# RUN systemctl mask systemd-tmpfiles-setup.service
# # systemd needs a different stop signal
# STOPSIGNAL SIGRTMIN+3

# Set environment to non-interactive again just in case

RUN curl -SL https://github.com/docker/compose/releases/download/v2.28.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
RUN ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
RUN set -o vi
COPY . /app/learn-nginx
WORKDIR /app/learn-nginx
RUN systemctl mask systemd-tmpfiles-setup.service

# NOTE: Run `systemctl start docker` to start docker daemon or use dockerd
# Use systemd as the entrypoint. 
CMD ["/lib/systemd/systemd"]
# EXPOSE 80