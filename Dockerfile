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
COPY ./artifacts/startwm.sh /etc/xrdp/startwm.sh
COPY ./artifacts/entrypoint.sh /entrypoint.sh
VOLUME /home
EXPOSE 3389
ENTRYPOINT ["/entrypoint.sh"]
