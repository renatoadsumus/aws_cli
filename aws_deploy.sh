#!/bin/bash
if [ "$1" = "Deploy" ]
then
    ./deploy_bucket_s3.sh
	sleep 10
   ./deploy_aplicacao_eb.sh
else
   ./criar_bucket_s3.sh
	sleep 10
   ./criar_aplicacao_eb.sh    
fi
