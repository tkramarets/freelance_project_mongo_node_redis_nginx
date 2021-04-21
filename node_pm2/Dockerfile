FROM ubuntu:latest

RUN apt update && \
    apt -y install bash && \
    apt -y install curl && \
    apt -y install git && \
    apt -y install wget && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt install --yes nodejs

RUN npm install -g pm2

RUN mkdir -p /var/www/project

WORKDIR /var/www/project

ADD . /var/www/project

RUN npm install

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5000

CMD pm2 start --no-daemon  processes.json
