#!/bin/bash

DB_DIR=$(cd $(dirname $0) && pwd)
cd $DB_DIR
source /home/isucon/env.sh

mysql -u$ISUBATA_DB_USER -p$ISUBATA_DB_PASSWORD -e "DROP DATABASE IF EXISTS isubata; CREATE DATABASE isubata;"
mysql isubata -u$ISUBATA_DB_USER -p$ISUBATA_DB_PASSWORD < ./isubata.sql
zcat ~/isubata/db/isucon7q-initial-dataset.sql.gz | mysql isubata -u$ISUBATA_DB_USER -p$ISUBATA_DB_PASSWORD
