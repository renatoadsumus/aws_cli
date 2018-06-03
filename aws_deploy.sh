#!/bin/bash
if [ "$1" = "Deploy" ]
then
    ./deploy_bucket_s3.sh
	sleep 5
   ./deploy_aplicacao_eb.sh
    sleep 5
else
   ./criar_bucket_s3.sh
	sleep 5
   ./criar_aplicacao_eb.sh 
	sleep 5
fi
