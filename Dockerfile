FROM alpine
MAINTAINER mmaguero <maguero@correo.ugr.es>

ENV PYTHONUNBUFFERED 1 RUN apk update

RUN apk update 
RUN apk upgrade

RUN apk add git

RUN apk add git
RUN apk add nodejs
RUN apk add npm
RUN apk add mongodb
RUN apk add mongodb-server
RUN service mongodb restart

RUN npm install mongoose
RUN npm install debug --save
RUN npm install winston --save 

RUN apk add -y python-setuptools
RUN apk add python-dev
RUN apk add build-essential
RUN apk add libpq-dev
RUN apk add python-reportlab
RUN easy_install pip
RUN pip install --upgrade pip
RUN python -m pip install Flask
RUN python -m pip install Flask-SQLAlchemy
RUN python -m pip install pyTelegramBotAPI

RUN apk add postgresql
RUN apk add postgresql-contrib
RUN apk add python-psycopg2

RUN apk add apache2
RUN echo "<h1>Apache with Docker</h1>" > /var/www/html/index.html
EXPOSE 80
ENTRYPOINT apache2ctl -D FOREGROUND	
