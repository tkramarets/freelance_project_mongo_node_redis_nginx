# freelance_project_mongo_node_redis_nginx
according to project plan

#Install docker on any Os:
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
systemctl enable docker
systemctl start docker


#Mongo on separate server:

edit .env 
fill default user and password
cat .env
# MongoDB
MONGO_INITDB_ROOT_USERNAME=root
MONGO_INITDB_ROOT_PASSWORD=root
MONGO_REPLICA_SET_NAME=rs0

run : ./scripts/mongo/prepare_mongo_to_first_start.sh

run : ./scripts/mongo/mongo_start.sh

#Mongo backup:
on host machine:
crontab -e
00 00 * * * /path/to/mongo-backup.sh {needed container} {database name} {path to dump}

#Mongo restore:
./scripts/mongo/mongo-restore.sh {needed container} {path to dump}

Frontend:

docker-compose -f docker-compose-front.yaml up
after all container starts:
docker-compose -f docker-compose-front.yaml start

Backend:
docker-compose -f docker-compose-backend.yaml up
after all container starts:
docker-compose -f docker-compose-backend.yaml start

Testserver:
docker-compose -f docker-compose-testsrv.yaml up
after all container starts:
docker-compose -f docker-compose-testsrv.yaml start

