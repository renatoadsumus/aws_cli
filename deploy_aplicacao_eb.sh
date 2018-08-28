#!/bin/bash
sleep 5
echo "Deploy nova versao no EB"
aws elasticbeanstalk create-application-version --application-name app-${APP_NAME}-renato --version-label ${VERSAO} --source-bundle S3Bucket=bucket-${APP_NAME}-renato-coutinho,S3Key=app_eb.zip

sleep 5
aws elasticbeanstalk update-environment --environment-name ${APP_NAME}-env-docker --version-label ${VERSAO}
