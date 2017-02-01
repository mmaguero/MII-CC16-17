FROM python:alpine
MAINTAINER MMAguero <maguero@correo.ugr.es>

ENV PYTHONUNBUFFERED 1 RUN apk update

RUN apk update && apk upgrade

RUN apk add git && apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/main py-psycopg2

RUN adduser -S -g wheel becalbot
USER becalbot

RUN mkdir -p /home/becalbot
WORKDIR /home/becalbot

COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
COPY . /tmp/

