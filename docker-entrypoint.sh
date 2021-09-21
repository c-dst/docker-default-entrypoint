#! /bin/bash

DIR=/docker-entrypoint.d

if [ -f /etc/alpine-release ] ; then
  OPTION="--exit-on-error"
else 
  OPTION="--verbose --exit-on-error"
fi

if [ -d "$DIR" ] ; then
  /bin/run-parts $OPTION "$DIR" || exit 1
fi

exec "$@"