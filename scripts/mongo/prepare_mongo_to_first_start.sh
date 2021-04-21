#!/usr/bin/env bash


echo "Prepare replication keyfile:"

openssl rand -base64 756 > keyfile.pem
echo "Sucessfully generated keyfile.pem"

echo "Chmod keyfile.pem 0400:"
chmod 0400 keyfile.pem
echo "Done"
echo "Chown 999 for keyfile.pem:"
chown 999:999 keyfile.pem

echo "Prepare local folders:"
mkdir -p ./data/mongo-setup/db ./data/mongo1/db ./data/mongo2/db ./data/mongo3/db ./data/mongo4/db ./data/mongo5/db ./data/mongo6/db ./data/mongo1/configdb ./data/mongo2/configdb ./data/mongo3/configdb ./data/mongo4/configdb ./data/mongo5/configdb ./data/mongo6/configdb
echo "Sucessfully create required folders"