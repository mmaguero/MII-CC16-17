#!/bin/bash
export AWS_KEY_ID='' #extraer de AWS
export AWS_SECRET_KEY='f' #extraer de AWS
export AWS_KEY_NAME='' #usuario-key-pair-region
export AWS_KEY_PATH='' # mismo nivel que Vagrantfile: usuario-key-pair-region.pem
#se imprimen los valores
echo AWS_KEY_ID     $AWS_KEY_ID
echo AWS_SECRET_KEY $AWS_SECRET_KEY
echo AWS_KEY_NAME   $AWS_KEY_NAME
echo AWS_KEY_PATH   $AWS_KEY_PATH
