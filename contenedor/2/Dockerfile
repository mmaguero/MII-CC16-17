FROM python:2.7-alpine
MAINTAINER mmaguero <maguero@correo.ugr.es>

ENV PYTHONUNBUFFERED 1 RUN apk update

RUN apk update &&  apk upgrade

RUN apk add git && \
 apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/main py-psycopg2 && \
 apk add python-dev

COPY requirements.txt /tmp/
RUN easy_install pip && \
 pip install --upgrade pip  && \
 pip install --requirement /tmp/requirements.txt
COPY . /tmp/

RUN apk add postgresql && \
 apk add postgresql-contrib


