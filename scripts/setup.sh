#!/bin/bash

MONGODB1=mongo1
MONGODB2=mongo2
MONGODB3=mongo3
MONGODB4=mongo4
MONGODB5=mongo5
MONGODB6=mongo6

until curl http://${MONGODB1}:27017/serverStatus\?text\=1 2>&1 | grep uptime | head -1; do
  printf '.'
  sleep 1
done


mongo --host ${MONGODB1}:27017 <<EOF
var cfg = {
    "_id": "rs0",
    "protocolVersion": 1,
    "version": 1,
    "members": [
        {
            "_id": 0,
            "host": "${MONGODB1}:27017",
            "priority": 2
        },
        {
            "_id": 1,
            "host": "${MONGODB2}:27017",
            "priority": 0
        },
        {
            "_id": 2,
            "host": "${MONGODB3}:27017",
            "priority": 0
        },
        {
            "_id": 3,
            "host": "${MONGODB4}:27017",
            "priority": 0
        },
        {
            "_id": 4,
            "host": "${MONGODB5}:27017",
            "priority": 0
        },
        {
            "_id": 5,
            "host": "${MONGODB6}:27017",
            "priority": 0
        }
    ],settings: {chainingAllowed: true}
};
rs.initiate(cfg, { force: true });
rs.reconfig(cfg, { force: true });
rs.slaveOk();
db.getMongo().setReadPref('nearest');
db.getMongo().setSlaveOk(); 
EOF

