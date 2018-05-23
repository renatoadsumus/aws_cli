#!/bin/bash
echo "Criando Aplicacao e Deploy Elastic Beanstalk"

aws elasticbeanstalk create-application --application-name app-geru-renato --description "Essa eh uma aplicacao em Pyhton que tera sua execucao em Docker no servico EB"

aws elasticbeanstalk create-application-version --application-name app-geru-renato --version-label v1 --source-bundle S3Bucket=bucket-geru-renato-coutinho,S3Key=app_geru_eb.zip

echo "Criando Ambiente no Elastic Beanstalk"

aws elasticbeanstalk create-environment --cname-prefix app-geru-desafio --application-name app-geru-renato --version-label v1 --environment-name geru_env_docker --solution-stack-name "64bit Amazon Linux 2018.03 v2.10.0 running Docker 17.12.1-ce"
