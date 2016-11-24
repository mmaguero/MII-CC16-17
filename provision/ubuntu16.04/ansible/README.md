##Ansible

1. Instalar Ansible en la máquina anfitrión, en nuestro caso *Ubuntu*:
``` sudo apt-get install ansible ```
2. Modificar el fichero hosts de ansible con la IP y usuario correspondiente a la máquina virtual AWS que contenga una imagen de Ubuntu Server 16.04:
``` 
[aws]
x.x.x.x. ansible_user = 'user' 
```
3. Agregar como variable de entorno el archivo hosts:
``` export ANSIBLE_HOSTS=/ubicacion/hosts ```
4. Conocer la ubicación del archivo de la clave privada (.pem) para conectarse a la máquina virtual de AWS.
5. Ejecutar la orden:
``` ansible-playbook -i $ANSIBLE_HOSTS --private-key /ubicacion/clave_privada.pem -b playbook-solicitudes.yml ```

[Aquí] (https://github.com/mmaguero/Ejercicios-CC16-17-MII/imgs/hitos/2/ansible/16) unos print screens del proceso...
