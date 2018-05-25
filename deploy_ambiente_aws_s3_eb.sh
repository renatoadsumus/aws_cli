#!/bin/bash
echo "Clonando nova versao do app do Git"
git clone https://github.com/renatoadsumus/geru_app.git artefato_deploy
sleep 2
zip -r -j app_geru_eb.zip /artefato_deploy/aws_eb/
echo "Enviando artefato_deploy para S3"
sleep 2
aws s3 cp app_geru_eb.zip s3://bucket-geru-renato-coutinho

sleep 2
echo "Deploy nova versao no EB"
aws elasticbeanstalk create-application-version --application-name app-geru-renato --version-label ${VERSAO} --source-bundle S3Bucket=bucket-geru-renato-coutinho,S3Key=app_geru_eb.zip

sleep 2
aws elasticbeanstalk update-environment --environment-name geru-env-docker --version-label ${VERSAO}