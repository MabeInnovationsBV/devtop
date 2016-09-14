#!/bin/bash

# Copyright Maxim B. Belooussov <belooussov@gmail.com>

# generate a random machine id upon startup
openssl rand -out /etc/machine-id -hex 16
# start dbus
dbus-daemon
# start xrdp session manager
xrdp-sesman
# and now start xrdp in the foreground
xrdp --nodaemon
