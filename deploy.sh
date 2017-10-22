#!/bin/bash

HOSTS=("$@")
USERNAME=$USER
NOTIFIER=`dirname $0`/notify.sh

set -x
for HOST in ${HOSTS[@]}; do
    $NOTIFIER "$USERNAME -> $HOST: deploy start "
    ssh -A "isucon@${HOST}" '
        cd /home/isucon/isubata/webapp/ruby && git pull origin master ;\
        sudo systemctl stop isubata.python.service;
        sudo systemctl restart isubata.ruby.service;
        sudo systemctl restart nginx;
        # sudo service restart mysql;
#       sudo service restart memcached;
'
    $NOTIFIER "$USERNAME -> $HOST: deploy finish "
done
