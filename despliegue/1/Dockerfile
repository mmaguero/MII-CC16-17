FROM node:alpine 
MAINTAINER mmaguero <maguero@correo.ugr.es>

RUN apk update && apk upgrade

RUN apk add git

RUN adduser -S -g wheel becalbot
USER becalbot

RUN mkdir -p /home/becalbot
WORKDIR /home/becalbot

COPY paquetes.json /tmp/
RUN npm install
COPY . /tmp/

EXPOSE 8080

CMD [ "npm", "start" ]

