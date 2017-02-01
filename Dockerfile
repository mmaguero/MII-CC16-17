FROM alpine
MAINTAINER mmaguero <maguero@correo.ugr.es>

ENV PYTHONUNBUFFERED 1 RUN apk -y update

RUN apk -y update && apk -y upgrade -U -a

RUN apk -y add git

RUN apk -y add git
RUN apk -y add nodejs
RUN apk -y add npm
RUN apk -y add mongodb
RUN apk -y add mongodb-server
RUN service mongodb restart

RUN npm install mongoose
RUN npm install debug --save
RUN npm install winston --save 

RUN apk add -y python-setuptools
RUN apk -y add python-dev
RUN apk -y add build-essential
RUN apk -y add libpq-dev
RUN apk -y add python-reportlab
RUN easy_install pip
RUN pip install --upgrade pip
RUN python -m pip install Flask
RUN python -m pip install Flask-SQLAlchemy
RUN python -m pip install pyTelegramBotAPI

RUN apk -y add postgresql
RUN apk -y add postgresql-contrib
RUN apk -y add python-psycopg2

RUN apk add apache2 -y
RUN echo "<h1>Apache with Docker</h1>" > /var/www/html/index.html
EXPOSE 80
ENTRYPOINT apache2ctl -D FOREGROUND	
