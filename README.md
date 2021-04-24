# freelance_project_mongo_node_redis_nginx

# Step 0 : 
> ensure that you have git installed :
```bash
git 
```
> if result is command not found you need to install it :
```bash
apt install git -y
```

# Step 1 : 
> clone repo:
```bash
git clone https://github.com/tkramarets/freelance_project_mongo_node_redis_nginx && cd freelance_project_mongo_node_redis_nginx
```

# Docker:
> Install docker on any Os:
> become as root using sudo bash
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
systemctl enable docker
systemctl start docker
```

# Docker-compose :
> install docker-compose on any Os:
```bash
curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

# Mongo on separate server:

> create .env file and 
> fill it with content below

```bash
cat .env
# MongoDB
MONGO_INITDB_ROOT_USERNAME=root
MONGO_INITDB_ROOT_PASSWORD=root
MONGO_REPLICA_SET_NAME=rs0
```

> RUN first time only
```bash
 ./scripts/mongo/prepare_mongo_to_first_start.sh
```

> Next starts
```bash
 ./scripts/mongo/mongo_start.sh
```

> stop
```bash
 ./scripts/mongo/mongo_stop.sh
```

# Mongo backup:
> on the host machine with mongo:
```bash
crontab -e
```
```bash
00 00 * * * /path/to/mongo-backup.sh {container name} {database name} {path to dump}
```
# Mongo restore:
> on the host machine with mongo:
```bash
./scripts/mongo/mongo-restore.sh {container name} {path to dump}
```
# Frontend:
> to start
```bash
docker-compose -f docker-compose-front.yaml up --build -d 
```

> to stop
```bash
docker-compose -f docker-compose-front.yaml stop
```

# Backend:
> to start
```bash
docker-compose -f docker-compose-backend.yaml up --build -d 
```
> to stop 
```bash
docker-compose -f docker-compose-backend.yaml stop
```
# Testserver:
> to start
```bash
docker-compose -f docker-compose-testsrv.yaml up --build -d 
```
> to stop
```bash 
docker-compose -f docker-compose-testsrv.yaml stop
```
