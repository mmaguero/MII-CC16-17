#Contenedores 

##Docker, en local

###Instrucciones

Para la instalación en Ubuntu, se puede seguir esta [guía](https://docs.docker.com/engine/installation/linux/ubuntulinux/). Para otros sistemas operativos [aquí](https://docs.docker.com/engine/installation/).

Con Docker instalado, se puede instalar desde Docker Hub la imagen del proyecto (Alpine, en su última versión):

`sudo docker pull mmaguero/mii-cc16-17`

Una vez instalado el contenedor, podemos acceder al mismo:

`sudo docker run -it mmaguero/mii-cc16-17 bash`

Para crear su propio contenedor en Docker Hub y sincronizarlo con GitHub puede seguir este [link](https://docs.docker.com/docker-hub/builds/).

[Aquí](https://github.com/mmaguero/MII-CC16-17/tree/master/contenedor/) puede ver el Dockerfile del contenedor instanciado, o bien, [aquí](https://hub.docker.com/r/mmaguero/mii-cc16-17/). [Aquí](https://github.com/mmaguero/Ejercicios-CC16-17-MII/blob/master/Contenedores/README.md#hito-4) se ven unos print-screens del proceso...

##Docker Machine, cloud

###Instrucciones

Incluso instalando [docker-machine](https://docs.docker.com/machine/) podemos instanciar una imagen en AWS siguiendo esta [guía](https://docs.docker.com/machine/examples/aws/). El comando de abajo crea una instancia Ubuntu 16.04 LTS en AWS en la zona de Frankfurt con nombre aws-1...

`sudo docker-machine create --driver amazonec2 --amazonec2-region eu-central-1 --amazonec2-ami ami-b03ffedf aws-1`

Una vez instalado y configurado, podemos ejecutar:

`sudo docker run -d -p puerto:80 --name myserver mmaguero/mii-cc16-17`

Arrancamos un contenedor, que llamaremos myserver, mapeando el puerto 80 del contenedor con el no. de *puerto* de la máquina anfitriona que indiquemos, a partir de la imagen *mmaguero/mii-cc16-17* (http://localhost:90/)

[Aquí](https://github.com/mmaguero/Ejercicios-CC16-17-MII/blob/master/Contenedores/README.md#hito-4) se ven unos print-screens del proceso...

##Vagrant y Docker

###Instrucciones

Con Vagrant especificando el proveedor Docker podemos *dockerizar* contenedores, pero antes debemos preparar el [Vagrantfile](Vagrantfile), luego:

`sudo vagrant up --provider=docker`

De esta manera podemos aprovechar las virtudes de Docker y/o Vagrant para nuestros ambientes, ya sean de test, desarrollo y/o producción.

[Aquí](https://github.com/mmaguero/Ejercicios-CC16-17-MII/tree/master/imgs/hitos/4/VagrantDocker) unos prints del proceso...
