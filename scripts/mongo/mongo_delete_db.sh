#!/usr/bin/env bash

if [ -z "$1" ]; then
echo "miss container name or database to drop usage ./mongo_delete_db.sh {container name} {database to drop}"
exit
fi

if [ -z "$2" ]; then
echo "miss container name or database to drop usage ./mongo_delete_db.sh {container name} {database to drop}"
exit
fi

docker exec -i $1 mongo $2 --eval "db.dropDatabase()"