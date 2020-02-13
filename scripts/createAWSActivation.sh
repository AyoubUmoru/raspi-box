#!/bin/bash

set -e

SRVROLENAME="ssm"
AWS_REGION="eu-central-1"

if [ -z "$1" ]
then
    echo "No parameter given...exiting"
    exit
fi
SERVICE_NAME=$1

aws ssm create-activation --default-instance-name ${SERVICE_NAME} --iam-role ${SRVROLENAME} --registration-limit 10 --region ${AWS_REGION} --tags "Key=service,Value=screenly"