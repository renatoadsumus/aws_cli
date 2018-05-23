#!/bin/bash
echo "Criando Bucket S3"
aws s3api create-bucket --bucket bucket_geru_renato_coutinho --region us-east-1 --acl public-read-write
git clone https://github.com/renatoadsumus/geru_app.git artefato_deploy
zip -r app_geru_eb.zip /artefato_deploy/aws_eb/
echo "Enviando artefato_deploy para S3"
aws s3 sync /artefato_deploy/app_geru_eb.zip s3://bucket_geru_renato_coutinho
