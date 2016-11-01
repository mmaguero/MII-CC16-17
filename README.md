# MII-CC16-17
Proyecto de la asignatura **Cloud Computing: Fundamentos e Infraestructura** del Máster Universitario en Ingeniería Informática de la ETSIIT, UGr

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
Almacenará información sobre los detalles de las solicitudes y su estado, utilizaremos una base de datos Relacional u Objeto/Relacional (oomo MySQL O PostgreSQL) con Python.

### Gestión de tareas
Administrará el avance y resolución de los requerimientos solicitados al bot, podría ser una web simple o responsiva en HTML, CSS y JS, con una base de datos Orientada a Objetos u Objeto/Relacional (como MongoDB o PostgreSQL)

## Licencia

GNU GENERAL PUBLIC LICENSE (Versión 3, 29 de Junio de 2007).
