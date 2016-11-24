##Chef

1. Instalar Chef en la máquina invitada o virtual. Una vez conectados a ella, mediante ssh y la clave privada (.pem), ejecutar (en este caso Ubuntu Server 16.04):
``` sudo curl -L https://www.opscode.com/chef/install.sh | sudo bash ```
2. Copiar los archivos necesarios al entorno virtual para ejecutar la receta. Para copiarlos se podría hacerlo de varias maneras: instalar git y clonar el respositorio donde se encuentren, copiarlos vía scp, o sftp, o arrastrar y soltar como en virtualbox. Mostramos las dos primeras:
- Git 
``` sudo apt-get install git ```
``` git clone https://github.com/mmaguero/MII-CC16-17.git ```
- scp
``` scp -r -i /ubicacion/clave_privada.pem nombre_carpeta usuario@servidor:ruta_servidor_donde_colocar ```
3. Ejecutar la orden con chef-solo:
``` sudo chef-solo -c GEventator/provision/Chef/chef/solo.rb ```

[Aquí] (https://github.com/mmaguero/Ejercicios-CC16-17-MII/imgs/hitos/2/chef/16) unos print screens del proceso...
