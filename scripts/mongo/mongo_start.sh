#!/usr/bin/env bash
docker-compose -f ./docker-compose-mongo.yaml up -d && sleep 50 && docker stop mongo-setup finalizer

echo "Mongo started...."
