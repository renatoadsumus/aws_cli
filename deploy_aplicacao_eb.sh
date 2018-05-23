#!/bin/bash
echo "Deploy nova versao no EB"
aws elasticbeanstalk create-application-version --application-name app-geru-renato --version-label v2 --source-bundle S3Bucket=bucket-geru-renato-coutinho,S3Key=app_geru_eb.zip


aws elasticbeanstalk update-environment --environment-name geru-env-docker --version-label v2