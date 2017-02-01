FROM python:2-alpine 
MAINTAINER mmaguero <maguero@correo.ugr.es>

RUN apk update && apk upgrade

RUN apk add git && apk add py3-psycopg2

RUN adduser -S -g wheel becalbot
USER becalbot

RUN mkdir -p /home/becalbot
WORKDIR /home/becalbot

COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
COPY . /tmp/

