FROM alpine 
MAINTAINER mmaguero <maguero@correo.ugr.es>

RUN apk -y update && apk -y upgrade -U -a

RUN apk -y add git
RUN apk -y add nodejs
RUN apk -y add npm
RUN apk -y add mongodb
RUN apk -y add mongodb-server
RUN service mongodb restart

RUN npm install mongoose
RUN npm install debug --save
RUN npm install winston --save  


