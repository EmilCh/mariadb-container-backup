#!/bin/sh
sed -i -e "s#your_username#$MARIADB_USER#" \
       -e "s#your_password#$MARIADB_PASS#" \
       -e "s#your_hostname#$MARIADB_HOST#" \
       /backup.sh

while true; 
    do 
        /backup.sh
        sleep 172800; 
    done 
