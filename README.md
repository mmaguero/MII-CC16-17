# MII-CC16-17
Proyecto de la asignatura **Cloud Computing: Fundamentos e Infraestructura** del Máster Universitario en Ingeniería Informática de la ETSIIT, UGr

*Actualizado el 01/02/2017*

# becalbot : Bot de Telegram para la gestión de requerimientos 
Consiste en el despliegue de un **bot de telegram**, para lo que utilizaremos *pyTelegramBotAPI*, una API para realizar bots en Telegram.

## Para qué
Este bot apoyará a las gestiones de requerimientos de un ente gubernamental del Paraguay: [*El Programa Nacional de Becas en el Exterior para el Fortalecimiento de la Investigación, la Innovación y la Educación del Paraguay Don Carlos Antonio López*](http://www.becal.gov.py/). 

## Por qué
Actualmente, debido al gran número de beneficiarios del programa gubernamental, se hace díficil poder gestionar las solicitudes de requerimientos en tiempo y en forma de todos ellos. Estas solicitudes se realizan vía e-mail, incluso la confirmación de recepción de las mismas lleva días, por lo que su resolución y respuesta muchos días más, por lo tanto un bot que gestione y administre estos requerimientos resulta útil.

# Tecnología
## Arquitectura
En principio utilizaremos la arquitectura basada en microservicios, donde estos son independientes entre si y por lo tanto, pueden ser desarrollados, desplegados y testeados de manera indiviual. Es deseable que el bot funcionará como API, donde el usuario se comunicara con el bot lo más natural posible.

## Microservicios
Es ideal contar con al menos estos dos microservicios:

### Gestión de solicitudes 
Almacenará información sobre los detalles de las solicitudes y su estado, utilizaremos una base de datos Relacional u Objeto/Relacional (como MySQL o PostgreSQL) con Python.

### Gestión de tareas
Administrará el avance y resolución de los requerimientos solicitados al bot, podría ser una web simple o responsiva en HTML, CSS y JS, con una base de datos Orientada a Objetos u Objeto/Relacional (como MongoDB o PostgreSQL)

# Provisionamiento

## ¿Dónde? 
- Ubuntu Server 16.04 en AWS (Amazon Web Services) para la *Gestión de solicitudes*
- Ubuntu Server 14.04 también en AWS para la *Gestión de tareas*.

## ¿Por qué dos instancias?
En la experiencia, la arquitectura de microservicios así lo sugiere, entonces decidí priorizar una instancia para cada servicio, para que puedan trabajar totalmente independientes.

## ¿Por qué AWS y Ubuntu Server?
AWS ofrece alternativas gratuitas y de bajo coste para [estudiantes](https://aws.amazon.com/es/education/awseducate/) de la universidad y los hay también para usuarios de [Github](https://education.github.com/pack), además es la pionera en este ámbito y unas de las más utilizadas. Ubuntu Server, tanto para su versión 14.04 como 16.04, es una distribución Linux muy popular y existe mucha documentación para casi cualquier cosa que se desee hacer.

## Sistema de provisionamiento

### Ansible
Su elección se basa en que este sistema Ansible funciona sobre Python (instalado por defecto en la mayoría de las imágenes), es muy práctico en su uso y posee el apoyo de Red Hat Inc.

### Chef
Chef es muy utilizado hoy día, incluso posee una comunidad muy activa. Al utilizarlo resulta bastante sencillo, aunque puede terminar resultando no muy práctico por su sistema de directorios, propios de usuarios más sotisficados.

### ¿Cómo provisionar?
+ Paquetes: Git, MongoDB, NodeJS, ndm; y con ndm: Mongoose.
  - Imagen de Ubuntu Server 14.04 sobre AWS, para Ansible clic [aquí](https://github.com/mmaguero/MII-CC16-17/tree/master/provision/ubuntu14.04/ansible), para Chef [aquí](https://github.com/mmaguero/MII-CC16-17/tree/master/provision/ubuntu14.04/chef). 
+ Paquetes: Git, PostgreSQL, pip; y con pip: Flask, FLask-SQLAlchemy, pyTelegramBotAPI.
  - Imagen de Ubuntu Server 16.04 sobre AWS, para Ansible clic [aquí](https://github.com/mmaguero/MII-CC16-17/tree/master/provision/ubuntu16.04/ansible), para Chef [aquí](https://github.com/mmaguero/MII-CC16-17/tree/master/provision/ubuntu16.04/chef). 

## Orquestación

+ Herramienta: Vagrant. 
+ Objetivo: Orquestar un ambiente software completo, clic [aquí](https://github.com/mmaguero/MII-CC16-17/tree/master/orquestacion/).
+ Se elige trabajar con instancias de AWS y VirtualBox por su popularidad y estabilidad, OpenStack por su gran capacidad y alcance (aka TryStack).

## Contenedores

+ Herramienta: Docker. 
+ Objetivo: Valerse de Docker para el uso de contenedores en un ambiente completo: crear un repositorio en Docker Hub sincronizado con GitHub y una instancia en local/AWS/Vagrant; clic [aquí](https://github.com/mmaguero/MII-CC16-17/tree/master/contenedor/)
  - [Dockerfile All](https://github.com/mmaguero/MII-CC16-17/blob/master/Dockerfile)
    1. [Dockerfile Tareas](https://github.com/mmaguero/MII-CC16-17/blob/master/contenedor/1/Dockerfile)
	2. [Dockerfile Solicitudes](https://github.com/mmaguero/MII-CC16-17/blob/master/contenedor/2/Dockerfile)
  - [Docker Hub](https://hub.docker.com/r/mmaguero/mii-cc16-17/)
+ De esta manera se cubren las herramientas de mayor aceptación: Docker + GitHub + AWS

## Despliegue

+ Herramientas:
 - Vagrant (AWS plugin)
 - AWS (Ubuntu 16.04)
 - Ansible
 - Docker & DockerHub (Alpine)
 - ...

## Licencia
GNU GENERAL PUBLIC LICENSE (Versión 3, 29 de Junio de 2007).
