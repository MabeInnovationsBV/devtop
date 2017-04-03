FROM fedora:25
MAINTAINER Maxim B. Belooussov <belooussov@gmail.com>
RUN dnf -y install man && \
    dnf -y update && \
    dnf -y groupinstall lxqt-desktop && \
    dnf -y install \
        dejavu-sans-fonts \
        dejavu-serif-fonts \
        openssh-clients \
        terminus-fonts \
        tigervnc-server \
        tmux \
        sudo && \
    dnf -y install \
        xrdp && \
    dnf clean all && \
    mkdir -p /etc/sudoers.d && \
    useradd -G wheel devtop && \
    echo "devtop ALL = (root) NOPASSWD: ALL" > /etc/sudoers.d/devtop && \
    echo "lxqt-session" > /etc/xrdp/startwm.sh && \
    echo "#!/bin/bash" >/entrypoint.sh && \
    echo "# Copyright Maxim B. Belooussov <belooussov@gmail.com>" >>/entrypoint.sh && \
    echo "xrdp-sesman" >>/entrypoint.sh && \
    echo "xrdp --nodaemon" >>/entrypoint.sh && \
    chmod +x /entrypoint.sh && \
    echo 'devtop:password' | chpasswd
EXPOSE 3389
ENTRYPOINT ["/entrypoint.sh"]
