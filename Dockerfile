FROM fedora:latest
MAINTAINER Maxim B. Belooussov <belooussov@gmail.com>
RUN dnf -y install man-pages && \
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
    useradd -G wheel devtop
RUN echo 'devtop:password' | chpasswd
RUN echo "devtop ALL = (root) NOPASSWD: ALL" > /etc/sudoers.d/devtop
RUN echo "mate-session" > /etc/xrdp/startwm.sh
RUN echo "#!/bin/bash" >/entrypoint.sh
RUN echo "# Copyright Maxim B. Belooussov <belooussov@gmail.com>" >>/entrypoint.sh
RUN echo "# generate a random machine id upon startup" >>/entrypoint.sh
RUN echo "openssl rand -out /etc/machine-id -hex 16" >>/entrypoint.sh
RUN echo "# start dbus" >>/entrypoint.sh
RUN echo "dbus-daemon" >>/entrypoint.sh
RUN echo "# start xrdp session manager" >>/entrypoint.sh
RUN echo "xrdp-sesman" >>/entrypoint.sh
RUN echo "# and now start xrdp in the foreground" >>/entrypoint.sh
RUN echo "xrdp --nodaemon" >>/entrypoint.sh
RUN chmod +x /entrypoint.sh
VOLUME /home
EXPOSE 3389
ENTRYPOINT ["/entrypoint.sh"]
