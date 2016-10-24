FROM fedora:latest
MAINTAINER Maxim B. Belooussov <belooussov@gmail.com>
RUN dnf -y install man && \
    dnf -y groupinstall mate-desktop && \
    dnf -y install \
        dejavu-sans-fonts \
        dejavu-serif-fonts \
        terminus-fonts \
        tigervnc-server \
        tmux \
        sudo \
        xdotool \
        xorg-x11-twm \
        xterm \
        xulrunner && \
    dnf -y install \
        xrdp && \
    dnf -y update && \
    dnf clean all && \
    mkdir -p /etc/sudoers.d && \
    useradd -G wheel devtop && \
    echo "devtop ALL = (root) NOPASSWD: ALL" > /etc/sudoers.d/devtop && \
    echo "mate-session" > /etc/xrdp/startwm.sh && \
    echo "#!/bin/bash" >/entrypoint.sh && \
    echo "# Copyright Maxim B. Belooussov <belooussov@gmail.com>" >>/entrypoint.sh && \
    echo "# generate a random machine id upon startup" >>/entrypoint.sh && \
    echo "openssl rand -out /etc/machine-id -hex 16" >>/entrypoint.sh && \
    echo "# start dbus" >>/entrypoint.sh && \
    echo "dbus-daemon" >>/entrypoint.sh && \
    echo "# start xrdp session manager" >>/entrypoint.sh && \
    echo "xrdp-sesman" >>/entrypoint.sh && \
    echo "# and now start xrdp in the foreground" >>/entrypoint.sh && \
    echo "xrdp --nodaemon" >>/entrypoint.sh && \
    chmod +x /entrypoint.sh && \
    echo 'devtop:password' | chpasswd
VOLUME /home
EXPOSE 3389
ENTRYPOINT ["/entrypoint.sh"]
