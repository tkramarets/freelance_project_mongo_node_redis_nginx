FROM node:latest


WORKDIR /var/www/api

COPY ./src ./src
COPY ./package.json ./package.json
COPY ./tsconfig.json ./tsconfig.json
COPY ./.pm2/staging/ecosystem.config.js ./ecosystem.config.js
COPY ./credentials/some-credentials.json ./some-credentials.json

RUN npm install
RUN npm install --global typescript
RUN tsc -p .
RUN npm install --global pm2

EXPOSE 3001
EXPOSE 3002
EXPOSE 27017

ENTRYPOINT ["pm2", "start", "/var/www/api/ecosystem.config.js"]
