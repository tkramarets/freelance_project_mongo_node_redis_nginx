# freelance_project_mongo_node_redis_nginx
according to project plan

Mongo on separate server:

docker-compose -f docker-compose-mongo.yaml up 
after all container starts:
docker-compose -f docker-compose-mongo.yaml start


Frontend:

docker-compose -f docker-compose-front.yaml up 
after all container starts:
docker-compose -f docker-compose-front.yaml start


Backend:
docker-compose -f docker-compose-backend.yaml up 
after all container starts:
docker-compose -f docker-compose-backend.yaml start
