FROM ubuntu:14.04 
MAINTAINER mmaguero <maguero@correo.ugr.es>

RUN apt-get -y update &&  apt-get -y upgrade

RUN apt-get -y install git
RUN apt-get -y install nodejs
RUN apt-get -y install npm
RUN apt-get -y install mongodb
RUN apt-get -y install mongodb-server
RUN service mongodb restart

RUN npm install mongoose


