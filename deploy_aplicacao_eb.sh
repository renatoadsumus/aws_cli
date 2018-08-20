#!/bin/bash
sleep 5
echo "Deploy nova versao no EB"
aws elasticbeanstalk create-application-version --application-name app-itau-renato --version-label ${VERSAO} --source-bundle S3Bucket=bucket-itau-renato-coutinho,S3Key=app_eb.zip

sleep 5
aws elasticbeanstalk update-environment --environment-name itau-env-docker --version-label ${VERSAO}
