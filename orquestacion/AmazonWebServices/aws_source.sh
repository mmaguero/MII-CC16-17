#!/bin/bash
export AWS_KEY_ID='value' #previous generate and extract AWS web console
export AWS_SECRET_KEY='value' #previous generate and extract AWS web console
export AWS_KEY_NAME='value' #usuario-key-pair-region
export AWS_KEY_PATH='name.pem' #~/directorio/usuario-key-pair-region.pem'
#printing values
echo $AWS_KEY_ID
echo $AWS_SECRET_KEY
echo $AWS_KEY_NAME
echo $AWS_KEY_PATH
