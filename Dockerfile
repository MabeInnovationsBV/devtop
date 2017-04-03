FROM centos:7
MAINTAINER Maxim B. Belooussov <belooussov@gmail.com>
RUN yum -y install epel-release man && \
    yum -y update && \
    yum -y groupinstall mate-desktop && \
    yum -y install \
        dejavu-sans-fonts \
        dejavu-serif-fonts \
        openssh-clients \
        terminus-fonts \
        tigervnc-server \
        tmux \
        sudo && \
    yum -y install \
        xrdp && \
    yum clean all && \
    mkdir -p /etc/sudoers.d && \
    useradd -G wheel devtop && \
    echo "devtop ALL = (root) NOPASSWD: ALL" > /etc/sudoers.d/devtop && \
    echo "mate-session" > /etc/xrdp/startwm.sh && \
    echo "#!/bin/bash" >/entrypoint.sh && \
    echo "# Copyright Maxim B. Belooussov <belooussov@gmail.com>" >>/entrypoint.sh && \
    echo "xrdp-sesman" >>/entrypoint.sh && \
    echo "xrdp --nodaemon" >>/entrypoint.sh && \
    chmod +x /entrypoint.sh && \
    echo 'devtop:password' | chpasswd
EXPOSE 3389
ENTRYPOINT ["/entrypoint.sh"]
