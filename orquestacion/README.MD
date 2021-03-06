#Orquestación

Se ha usado Vagrant, que permiten montar una imagen (box), mediante ella realizaremos la orquestación de un entorno de desarrollo para los servicios propuestos (tareas, solicitudes): local con VirtualBox, test con OpenStack (aka TryStack), production con AWS.

##Instalación

1. Repositorio oficial de la distribución Linux (más populares)

`sudo yum install vagrant`

`sudo apt-get install vagrant`

1. Descargarla de https://www.vagrantup.com/downloads.html e instalarla (en Linux)

`wget https://releases.hashicorp.com/vagrant/1.8.7/vagrant_1.8.7_x86_64.deb`

`sudo dpkg -i vagrant_1.8.7_x86_64.deb`

`sudo [apt-get|yum] install ruby`

`sudo [apt-get|yum] install rubygems`

##Vagrant y VirtualBox

Montaremos una máquina virtual para VirtualBox pero desde Vagrant, cuyo propósito es utilizarla de manera local para el desarrollo de los servicios.

###Instalación

1. Descargarla de http://download.virtualbox.org e instalarla (Linux, Ubuntu Xenial)

`wget http://download.virtualbox.org/virtualbox/5.1.10/virtualbox-5.1_5.1.10-112026~Ubuntu~xenial_amd64.deb`

`sudo dpkg -i virtualbox-5.1_5.1.10-112026~Ubuntu~xenial_amd64.deb`

- Y su pack de extensiones

`wget http://download.virtualbox.org/virtualbox/5.1.10/Oracle_VM_VirtualBox_Extension_Pack-5.1.10-112026.vbox-extpack`

`sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-5.1.10-112026.vbox-extpack`

###Montamos la imagen

+ `vagrant box add https://atlas.hashicorp.com/ARTACK/boxes/debian-jessie` o puedes buscar otra [aquí](http://www.vagrantbox.es/) o [aquí](https://atlas.hashicorp.com/debian)

`vagrant init`

`vagrant up`

`vagrant ssh`

+ Provisionamos con [Chef-Solo](https://github.com/mmaguero/MII-CC16-17/tree/master/orquestacion/VirtualBox)

`vagrant provision`

o si quisieramos eliminarla

`vagrant destroy`

Siempre sobre un mismo directorio...

Imágenes del proceso [aquí](https://github.com/mmaguero/Ejercicios-CC16-17-MII/tree/master/imgs/hitos/3/VirtualBox)

##Vagrant y OpenStack

Montaremos una instancia para TryStack (opción gratuita para OpenStack) pero desde Vagrant, cuyo propósito es utilizarla en la nube para el testing de los servicios, aunque nos permite orquestar sólo hasta 3 instancias (una sola con IP Flotante), de todas formas veremos cómo hacerlo.

###Instalamos el plugin

`sudo vagrant plugin install vagrant-openstack-provider`

###Montamos la imagen

+ Primero configuramos el entorno de TryStack, que viene muy bien explicado [aquí](http://jj.github.io/CC/documentos/temas/Automatizando_cloud#cli-de-openstack), luego creamos un Vagrantfile con dos instancias para conectar con [TryStack](https://github.com/mmaguero/MII-CC16-17/tree/master/orquestacion/OpenStack/), allí provisionaremos con [Chef-Solo](https://github.com/mmaguero/MII-CC16-17/tree/master/orquestacion/OpenStack/) ambas. 

`vagrant up`

Si quisiéramos conectarnos

`vagrant ssh nombre-box-vagrant`

*TryStack sólo proporciona una IP Flotante por lo que solo se podrà provisionar una sola máquina al mismo tiempo.*

Imágenes del proceso [aquí](https://github.com/mmaguero/Ejercicios-CC16-17-MII/tree/master/imgs/hitos/3/OpenStack/)

##Vagrant y AWS

Montaremos una instancia para AWS pero desde Vagrant, cuyo propósito es utilizarla en la nube como entrono de producción de los servicios.

Primero debemos configurar el entorno de AWS, [aquí](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/get-set-up-for-amazon-ec2.html) viene muy bien explicado, no olvidar crear un *grupo de seguridad* con puertos HTTP, HTTPS y SSH necesarios. Luego crear el fichero [aws-source.sh](https://github.com/mmaguero/MII-CC16-17/tree/master/orquestacion/AmazonWebServices) para las variables de entorno, para completarlo puede servirse de este [enlace](http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSGettingStartedGuide/AWSCredentials.html).

###Instalamos el plugin

`vagrant plugin install vagrant-aws`

###Montamos la imagen

Creamos un [Vagrantfile](https://github.com/mmaguero/MII-CC16-17/tree/master/orquestacion/AmazonWebServices) apropiado, allí provisionaremos con [Chef-Solo](https://github.com/mmaguero/MII-CC16-17/tree/master/orquestacion/AmazonWebServices) ambas, antes exportamos las variables con el fichero antes mencionado.

`source aws_source.sh`

`vagrant box add cloud https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box`

`vagrant up --provider=aws`

Si quisiéramos conectarnos:

`vagrant ssh nombre-box-vagrant` aka *cloud*

Imágenes del proceso [aquí](https://github.com/mmaguero/Ejercicios-CC16-17-MII/tree/master/imgs/hitos/3/AmazonWebServices)

##Vagrant y Docker

Ir a la sección de *Contenedores*, clic [aquí](../contenedor/README.MD#vagrant-y-docker) 

