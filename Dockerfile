FROM fedora:latest
MAINTAINER Maxim B. Belooussov <belooussov@gmail.com>
RUN echo 'root:password' | chpasswd
RUN dnf -y install man-pages && \
    dnf -y groupinstall mate-desktop && \
    dnf -y install \
        dejavu-sans-fonts \
        dejavu-serif-fonts \
        tigervnc-server \
        xdotool \
        xorg-x11-twm \
        xterm \
        xulrunner && \
    dnf -y install \
        xrdp && \
    dnf -y update && \
    dnf clean all
COPY ./artifacts/startwm.sh /etc/xrdp/startwm.sh
COPY ./artifacts/entrypoint.sh /entrypoint.sh
EXPOSE 3389
ENTRYPOINT ["/entrypoint.sh"]
