#!/usr/bin/env bash

TS=$(date +'%Y%m%d%')

docker exec -t $1 mongodump --out /data/$2-backup-${TS} --db $2
docker cp $1:/data/$2-backup-${TS} $3
docker rm $1:/data/$2-backup-${TS}