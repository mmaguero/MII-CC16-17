#Despliegue

La idea es integrar todo lo anterior visto para realizar el despliegue final que alojará la aplicación propuesta, la cual se conforma de dos microservicios, cada uno en una máquina virtual diferente con AWS y sus propios contenedores con Docker: tareas, solicitudes. 

##MV

Se utilizará AWS puesto que la he utilizado durante toda la asignatura, actualmente goza de mayor aceptación, como se puede ver [aquí](https://aws.amazon.com/es/resources/gartner-2016-mq-learn-more/). Se tomará la AMI de Amazon Linux dotada con Docker, por lo que en el Vagrantfile se provisionará con Docker ambas MV.

##Provisionamiento

Como ya se ha citado anteriormente, se utilizará Docker, puesto que [Vagrant](https://www.vagrantup.com/docs/provisioning/docker.html) también permite provisionar con esta herramienta, lo que es muy útil para nuestro despliegue, teniendo ya Docker instalado en las AMI de AWS, donde los contenedores tendrán todo lo necesario para los servicios. 

##Contenedores

Se han creado dos contenedores, uno para cada servicio, con todos los paquetes utilizados por cada uno. Se toma Alpine como base ya que es una distribución ligera:

+ Servicio de Tareas con [python:2.7-alpine](https://hub.docker.com/_/python/)
+ Servicio de Solicitudes con [node:alpine](https://hub.docker.com/_/node/)

###Docker Hub

El Dockerfile del servicio de tareas se encuentra [aquí](1), el de solicitudes [aquí](2), se escribieron siguiendo las recomendaciones y [buenas prácticas](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/). Estos están vinculados a [Docker Hub](https://hub.docker.com/r/mmaguero/mii-cc16-17/) y a su vez a esta cuenta de Github, cada *push* actualiza los contendores creados, que son [cuatro](https://hub.docker.com/r/mmaguero/mii-cc16-17/tags/): service1 y service2, sobre Alpine, para este despliegue final, tareas y solicitudes, sobre Ubuntu, para [contenedor](https://github.com/mmaguero/MII-CC16-17/tree/master/contenedor/).

##Orquestación

La orquestación se hizo con la herramienta Vagrant, sin dudas una herramienta robusta y poderosa. Con Vagrant se orquestan las dos máquinas virtuales en AWS y a su vez se provisiona con Docker, de este modo, tras una sólo comando `vagrant up --provider=aws` (aunque antes hay que cargar las credenciales de AWS: `source aws_source.sh`) se realiza el despliegue completo de la aplicación para todos los servicios: se crean dos MV en AWS y se coloca el contenedor correspondiente corriendo sobre cada una.

##Servicios externos

Estos son servicios que son útiles para externalizar las bases de datos o logs, de tal manera de tener todo de la forma más escalable posible. Como no tenemos código fuente, sólo lo referente a el despliegue, se sugiere lo siguiente para cada servicio...

###Bases de datos

####mLab

Para gestionar la base de datos del servicio de tareas, se utilizará [MongoLab](https://mlab.com/) como otro servicio pero externo, aunque nos ofrece sólo 500 MB de almacenamiento en bases de datos *MongoDB* de forma gratuita. Para ello debemos crear una cuenta, y por supuesto, crear una fuente de datos, y una vez creada, se pueden utilizar los datos de conexión que proporciona para la aplicación, con *NodeJS* y *mongoose*:

![mLab](http://www.prowebmerida.com/file/2016/08/crear-usuario-en-mLab.jpg)
Fuentes [1](http://www.prowebmerida.com/migrar-parse-a-mlab/) y [2](http://wikis.fdi.ucm.es/ABD/Tutorial_MongoDB_DBaaS)

####PostgreSQL

Para gestionar la base de datos del servicio de solicitudes, se utilizará [ElephantSQL](https://www.elephantsql.com/plans.html) como otro servicio pero externo, aunque nos ofrece sólo 20 MB de almacenamiento (menor al caso anterior) en bases de datos *PostgreSQL* de forma gratuita. Para ello debemos crear una cuenta, y como el caso anterior, crear una fuente de datos, y una vez creada, se pueden utilizar los datos de conexión que proporciona para la aplicación, con *Python* y *psycopg2*:

![ESQL](http://www.dbi-services.com/images/easyblog_images/153/pgcloud3.png)
[Fuente](http://blog.dbi-services.com/a-free-postgresql-cloud-database/)

###Logging

####Logsene

[Logsene](https://sematext.com/logsene/) ofrece un servicio de Logging externo, permite agregar logs de varias fuentes, como NodeJS. Existe una cuenta free que gestiona los logs de los ultimos siete días hasta 500 MB por día. Es necesario crear una cuenta gratuita en y configurar en el código fuente lo necesario, en NodeJS, el módulo *winston* por ejemplo permite esto, el mismo se encuentra en el [contendor pertinente](1).
[Fuente](https://sematext.com/logsene/)

####Papertrail

[Papertrail](https://papertrailapp.com/) es un sistema de logs que ofrece una cuenta gratuita de hasta 100 MB al mes, con logs de hasta siete días atrás. Cabe enfatizar, que su integración con Python es simple, puesto que se integra con el paquete de *logging* (llamado logging) de Python (que viene por defecto desde la versión 2.3) y basta con agregar la dirección de la cuenta y vincularla.
[Fuente](http://help.papertrailapp.com/kb/configuration/configuring-centralized-logging-from-python-apps/)

##Conclusiones

De esta manera se logra el despliegue completo de la aplicación para todos los servicios; utilizar Docker, Docker Hub, AWS y Vagrant nos permite trabajar de una manera muy escalable, multiplataforma y muy práctica; que tras una previa preparaciòn, todo se resume en una sola línea de comando para poder desplegar en la nube una aplicaciòn.

###Lectura Recomendada

+ [Heroku, EC2 (AWS) con Vagrant, Docker, y Dokku](http://blog.clearbit.com/ec2-heroku/)
+ [Una pequeña gran implementación de PaaS](http://dokku.viewdocs.io/dokku/)
+ [Dokku, primeros pasos](http://codehero.co/como-instalar-y-utilizar-dokku/)

##Pantallazos

Imágenes Docker Hub

![1](https://github.com/mmaguero/Ejercicios-CC16-17-MII/blob/master/imgs/hitos/5/5.png)

Vagrant

![2](https://github.com/mmaguero/Ejercicios-CC16-17-MII/blob/master/imgs/hitos/5/1.png)

![3](https://github.com/mmaguero/Ejercicios-CC16-17-MII/blob/master/imgs/hitos/5/2.png)

AWS

![4](https://github.com/mmaguero/Ejercicios-CC16-17-MII/blob/master/imgs/hitos/5/4.png)

Contenedor

![5](https://github.com/mmaguero/Ejercicios-CC16-17-MII/blob/master/imgs/hitos/5/3.png)



