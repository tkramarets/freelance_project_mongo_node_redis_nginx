# freelance_project_mongo_node_redis_nginx
according to project plan

#Install docker on any Os:
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
systemctl enable docker
systemctl start docker
```

#Mongo on separate server:

edit .env 
fill default user and password
######################
```bash
cat .env
# MongoDB
MONGO_INITDB_ROOT_USERNAME=root
MONGO_INITDB_ROOT_PASSWORD=root
MONGO_REPLICA_SET_NAME=rs0
```

###RUN only first time
```bash
 ./scripts/mongo/prepare_mongo_to_first_start.sh
```

### next starts
```bash
 ./scripts/mongo/mongo_start.sh
```

### stop
```bash
 ./scripts/mongo/mongo_stop.sh
```

#Mongo backup:
on the host machine:
```bash
crontab -e
00 00 * * * /path/to/mongo-backup.sh {container name} {database name} {path to dump}
```
#Mongo restore:
```bash
./scripts/mongo/mongo-restore.sh {container name} {path to dump}
```
Frontend:
to start
```bash
docker-compose -f docker-compose-front.yaml up -build -d 
```

to stop
```bash
docker-compose -f docker-compose-front.yaml stop
```

Backend:
to start
```bash
docker-compose -f docker-compose-backend.yaml up -build -d 
```
to stop 
```bash
docker-compose -f docker-compose-backend.yaml stop
```
Testserver:
to start
```bash
docker-compose -f docker-compose-testsrv.yaml up -build -d 
```
to stop
```bash 
docker-compose -f docker-compose-testsrv.yaml stop
```
