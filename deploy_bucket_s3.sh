#!/bin/bash
echo "Clonando nova versao do app do Git"
git clone https://github.com/renatoadsumus/geru_app.git artefato_deploy
sleep 2
zip -r -j app_geru_eb.zip /artefato_deploy/aws_eb/
echo "Enviando artefato_deploy para S3"
sleep 2
aws s3 cp app_geru_eb.zip s3://bucket-geru-renato-coutinho