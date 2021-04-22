#!/usr/bin/env bash

docker-compose -f ../../docker-compose-mongo.yaml up -d && sleep 50 && docker-compose stop mongo-setup finalizer

echo "Mongo started...."