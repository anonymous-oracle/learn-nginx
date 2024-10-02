FROM ubuntu/bind9
RUN apt update
RUN apt-get update && apt-get -y install bind9
# Install systemd
RUN apt-get update && apt-get install -y systemd systemd-sysv && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

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
RUN systemctl mask systemd-tmpfiles-setup.service
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN /entrypoint.sh
# CMD [ "systemctl","enable","bind9" ]