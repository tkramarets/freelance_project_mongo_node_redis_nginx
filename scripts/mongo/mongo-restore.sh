#!/usr/bin/env bash

if [ -z "$1" ]; then
echo "miss container name or path to dump ./mongo-restore.sh {container name} {path to dump}"
exit
fi

if [ -z "$2" ]; then
echo "miss container name or path to dump ./mongo-restore.sh {container name} {path to dump}"
exit
fi


docker cp $2 $1:/data
docker exec -i $1 mongorestore /data/$( basename $2)
dcoker rm $1:/data/$( basename $2 )