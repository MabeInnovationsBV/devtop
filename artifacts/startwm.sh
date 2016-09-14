#!/bin/sh
 
if [ -r /etc/default/locale ]; then
  . /etc/default/locale
  export LANG LANGUAGE
fi
if [ -x ~/.Xclients ] ; then
  ~/.Xclients
else 
  mate-session
fi

