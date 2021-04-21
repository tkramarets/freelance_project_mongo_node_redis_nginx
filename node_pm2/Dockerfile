FROM node:alpine

WORKDIR /usr/app

RUN npm install --global pm2
RUN npm install --global mongoose
COPY ./project/package.json ./
COPY ./project/package*.json ./
COPY ./processes.json ./
RUN npm install --production

COPY ./project/* ./

EXPOSE 5000

USER node

CMD pm2 start --no-daemon processes.json