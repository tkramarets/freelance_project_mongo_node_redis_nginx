# freelance_project_mongo_node_redis_nginx
according to project plan

#Install docker on any Os:
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh


#Mongo on separate server:

docker-compose -f docker-compose-mongo.yaml up
after all container starts:
docker-compose -f docker-compose-mongo.yaml start

#Mongo backup:
on host machine:
crontab -e
00 00 * * * /path/to/backup.sh

#Mongo restore:
mongo-restore.sh path to dump needed container

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

