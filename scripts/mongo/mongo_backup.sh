#!/usr/bin/env bash


if [ -z "$1" ]; then
echo "missed container name or database name or path to save dump ./mongo-backup.sh {container name} {database name}"
exit
fi

if [ -z "$2" ]; then
echo "missed container name or database name or path to save dump ./mongo-backup.sh {container name} {database name}"
exit
fi

if [ -z "$3" ]; then
echo "missed container name or database name or path to save dump ./mongo-backup.sh {container name} {database name}"
exit
fi


TS=$(date +'%Y%m%d%')

docker exec -t $1 mongodump --out /data/$2-backup-${TS} --db $2
docker cp $1:/data/$2-backup-${TS} $3
docker rm $1:/data/$2-backup-${TS}