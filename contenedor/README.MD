#Contenedores 

##Docker, en local

###Instalación

Para la instalación en Ubuntu, se puede seguir esta [guía](https://docs.docker.com/engine/installation/linux/ubuntulinux/). Para otros sistemas operativos [aquí](https://docs.docker.com/engine/installation/).

Con Docker instalado, se puede instalar desde Docker Hub la imagen del proyecto (Ubuntu, en su última versión):

`sudo docker pull mmaguero/mii-cc16-17`

Una vez instalado el contenedor, podemos acceder al mismo:

`sudo docker run -it mmaguero/mii-cc16-17 bash`

Para crear su propio contenedor y sincronizarlo con GitHub puede seguir este [link](https://docs.docker.com/docker-hub/builds/).

[Aquí](https://github.com/mmaguero/MII-CC16-17/blob/master/Dockerfile) puede ver el Dockerfile del contenedor instanciado, o bien, [aquí](https://hub.docker.com/r/mmaguero/mii-cc16-17/).

##Docker Machine, cloud

###Instalación

Incluso instalando [docker-machine](https://docs.docker.com/machine/) podemos instanciar una imagen en AWS siguiendo esta [guía](https://docs.docker.com/machine/examples/aws/). Una vez instalado y configurado, ejecutamos:

`sudo docker run -d -p puerto:80 --name myserver mmaguero/mii-cc16-17`

Arrancamos un contenedor, que llamaremos myserver, mapeando el puerto 80 del contenedor con el no. de *puerto* de nuestra máquina que indiquemos, a partir de la imagen *mmaguero/becalbot* (http://localhost:90/)

[Aquí](https://github.com/mmaguero/Ejercicios-CC16-17-MII/blob/master/Contenedores/README.md#hito-4) se ven unos print-screens del proceso...
