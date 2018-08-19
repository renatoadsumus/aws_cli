#!/bin/bash

echo "Zipando a pasta artefato_deploy enviar para S3"
cd /opt/artefato_deploy/
rm -fr .ebextensions/environmentvariables.config_template
zip -r app_eb.zip .

sleep 2
echo "Enviando artefato_deploy para S3"
aws s3 cp app_eb.zip s3://bucket-itau-renato-coutinho

####http://bucket-itau-renato-coutinho.s3.amazonaws.com/app_itau_eb.zip