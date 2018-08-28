#!/bin/bash
################## PASSOS PARA CRIAR E DEPLOY NO ELASTIC BEANSTALK ###############
sleep 5
echo "Criando Aplicacao e Deploy Elastic Beanstalk"
aws elasticbeanstalk create-application --application-name app-${APP_NAME}-renato --description "Essa eh uma aplicacao em Pyhton que tera sua execucao em Docker no servico EB"

sleep 5
aws elasticbeanstalk create-application-version --application-name app-${APP_NAME}-renato --version-label  ${VERSAO} --source-bundle S3Bucket=bucket-${APP_NAME}-renato-coutinho,S3Key=app_eb.zip

echo "Criando Ambiente no Elastic Beanstalk"
sleep 5
aws elasticbeanstalk create-environment --cname-prefix app-${APP_NAME}-desafio --application-name app-${APP_NAME}-renato --version-label ${VERSAO} --environment-name ${APP_NAME}-env-docker --solution-stack-name "64bit Amazon Linux 2018.03 v2.10.0 running Docker 17.12.1-ce" 
