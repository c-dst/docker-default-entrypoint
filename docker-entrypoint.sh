#!/bin/bash
  
DIR=/docker-entrypoint.d

if [[ -d "$DIR" ]] ; then
  if [ -f /etc/alpine-release ] ; then
    OPTION=""
  else 
    OPTION="--verbose"
  fi
  /bin/run-parts $OPTION "$DIR"
fi

exec "$@"
