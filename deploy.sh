#!/bin/bash

HOSTS=("$@")
USERNAME=$USER
NOTIFIER=`dirname $0`/notify.sh

DB_SERVER='app3143'

set -x
for HOST in ${HOSTS[@]}; do
    if [ $HOST == 'app3143' ]; then
        echo "${HOST} is DB server. skip..."
        continue
    fi
    $NOTIFIER "$USERNAME -> $HOST: deploy start "
   ssh -A "isucon@${HOST}" '
       cd /home/isucon/isubata/webapp/ruby && git pull origin master ;\
       sudo systemctl stop isubata.python.service;
       sudo systemctl restart isubata.ruby.service;
       sudo systemctl restart nginx;
       sudo systemctl restart redis;
    #    redis-cli flushall;
'
   $NOTIFIER "$USERNAME -> $HOST: deploy finish "
done

$NOTIFIER "$USERNAME -> $DB_SERVER: db init start "
ssh -A isucon@$DB_SERVER '
    cd /home/isucon/isubata/webapp/ruby && git pull origin master;
    /home/isucon/isubata/webapp/ruby/db/init.sh;
    sudo systemctl restart mysql
'
$NOTIFIER "$USERNAME -> $DB_SERVER: db init finish"
