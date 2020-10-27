#!/bin/sh
  
DIR=/docker-entrypoint.d

if [ -f /etc/alpine-release ] ; then
  OPTION=""
else 
  OPTION="--verbose"
fi

if [[ -d "$DIR" ]] ; then

  /bin/run-parts $OPTION "$DIR"
fi

exec "$@"
