#!/bin/bash
############### PASSOS PARA CRIAR E DEPLOY NO S3 #########################

echo "Criando Bucket S3"
aws s3api create-bucket --bucket bucket-geru-renato-coutinho --region us-east-1 --acl public-read-write

sleep 2
git clone https://github.com/renatoadsumus/geru_app.git artefato_deploy

sleep 2
echo "Zipando a pasta artefato_deploy enviar para S3"
cd /artefato_deploy/aws_eb/
rm -fr .ebextensions/environmentvariables.config_template
zip -r app_geru_eb.zip .

sleep 2
echo "Enviando artefato_deploy para S3"
aws s3 cp app_geru_eb.zip s3://bucket-geru-renato-coutinho

sleep 5
