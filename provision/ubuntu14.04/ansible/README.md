##Ansible

+ Instalar Ansible en la máquina anfitrión, en nuestro caso *Ubuntu*:
  - ``` sudo apt-get install ansible ```
+ Modificar el fichero hosts de ansible con la IP y usuario correspondiente a la máquina virtual AWS que contenga una imagen de Ubuntu Server 14.04:
  - ``` 
[aws]
x.x.x.x. ansible_user = 'user' 
```
+ Agregar como variable de entorno el archivo hosts:
  - ``` export ANSIBLE_HOSTS=/ubicacion/hosts ```
+ Conocer la ubicación del archivo de la clave privada (.pem) para conectarse a la máquina virtual de AWS.
+ Ejecutar la orden:
  - ``` ansible-playbook -i $ANSIBLE_HOSTS --private-key /ubicacion/clave_privada.pem -b playbook-tareas.yml ```

[Aquí] (https://github.com/mmaguero/Ejercicios-CC16-17-MII/tree/master/imgs/hitos/2/ansible/14) unos print screens del proceso...
