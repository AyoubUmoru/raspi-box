#!/bin/bash
SRVROLENAME="ssm"

set -e

if [ ! -f "config/ssmtrust.json" ]; then
    echo "No configuration file found for environment   ...exiting"
    exit
fi
awsume zdf-all-admin
aws iam create-role --role-name ${SRVROLENAME} --assume-role-policy-document file://config/ssmtrust.json
aws iam attach-role-policy --role-name ${SRVROLENAME} --policy-arn arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore  
aws iam attach-role-policy --role-name ${SRVROLENAME}  --policy-arn arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy
#New-IAMRole -RoleName SSMServiceRole -AssumeRolePolicyDocument (Get-Content -raw SSMService-Trust.json)