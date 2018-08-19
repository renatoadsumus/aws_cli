#!/bin/bash
################## PASSOS PARA CRIAR E DEPLOY NO ELASTIC BEANSTALK ###############
sleep 5
echo "Criando Aplicacao e Deploy Elastic Beanstalk"
aws elasticbeanstalk create-application --application-name app-itau-renato --description "Essa eh uma aplicacao em Pyhton que tera sua execucao em Docker no servico EB"

sleep 5
aws elasticbeanstalk create-application-version --application-name app-itau-renato --version-label  ${VERSAO} --source-bundle S3Bucket=bucket-itau-renato-coutinho,S3Key=app_eb.zip

echo "Criando Ambiente no Elastic Beanstalk"
sleep 5
aws elasticbeanstalk create-environment --cname-prefix app-itau-desafio --application-name app-itau-renato --version-label ${VERSAO} --environment-name itau-env-docker --solution-stack-name "64bit Amazon Linux 2018.03 v2.10.0 running Docker 17.12.1-ce" 
