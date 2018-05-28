#!/bin/bash
echo "Deploy nova versao no EB"
aws elasticbeanstalk create-application-version --application-name app-geru-renato --version-label ${VERSAO} --source-bundle S3Bucket=bucket-geru-renato-coutinho,S3Key=app_geru_eb.zip

sleep 2
aws elasticbeanstalk update-environment --environment-name geru-env-docker --version-label ${VERSAO}