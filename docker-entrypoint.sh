#!/bin/bash
set -xe
if [ ! -f /mlaunch/data/.mlaunch_startup ]
then
  mlaunch init $MLAUNCH_INIT_ARGS --bind_ip 0.0.0.0
else
  mlaunch start
fi

if [ $# -eq 0 ]
then
  tail -f /dev/null
  mlaunch kill
else
  exec "$@"
  mlaunch kill
fi
