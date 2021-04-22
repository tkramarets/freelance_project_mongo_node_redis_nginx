#!/usr/bin/env bash

docker cp $2 $1:/data
docker exec -i $1 mongorestore /data/$( basename $2)
dcoker rm -i $2 $1:/data/$( basename $2 )