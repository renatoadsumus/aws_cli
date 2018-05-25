#!/bin/bash

############### PASSOS PARA CRIAR E DEPLOY NO S3 #########################
echo "Criando Bucket S3"
aws s3api create-bucket --bucket bucket-geru-renato-coutinho --region us-east-1 --acl public-read-write
sleep 2
git clone https://github.com/renatoadsumus/geru_app.git artefato_deploy
sleep 2
zip -r -j app_geru_eb.zip /artefato_deploy/aws_eb/
echo "Enviando artefato_deploy para S3"
sleep 2
aws s3 cp app_geru_eb.zip s3://bucket-geru-renato-coutinho

################## PASSOS PARA CRIAR E DEPLOY NO ELASTIC BEANSTALK ###############
sleep 2
echo "Criando Aplicacao e Deploy Elastic Beanstalk"
aws elasticbeanstalk create-application --application-name app-geru-renato --description "Essa eh uma aplicacao em Pyhton que tera sua execucao em Docker no servico EB"

sleep 2
aws elasticbeanstalk create-application-version --application-name app-geru-renato --version-label  ${VERSAO} --source-bundle S3Bucket=bucket-geru-renato-coutinho,S3Key=app_geru_eb.zip

echo "Criando Ambiente no Elastic Beanstalk"
sleep 2
aws elasticbeanstalk create-environment --cname-prefix app-geru-desafio --application-name app-geru-renato --version-label ${VERSAO} --environment-name geru-env-docker --solution-stack-name "64bit Amazon Linux 2018.03 v2.10.0 running Docker 17.12.1-ce"