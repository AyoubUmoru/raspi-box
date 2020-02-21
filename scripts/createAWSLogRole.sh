#!/bin/bash
SRVROLENAME="CloudWatchAgentRaspi"
LOGGING_AWS_IAMUSER="CloudWatchRaspi"

set -e

if [ ! -f "config/cloudwatch.json" ]; then
    echo "No configuration file found for environment   ...exiting"
    exit
fi
awsume zdf-all-admin

aws iam create-user --user-name ${LOGGING_AWS_IAMUSER}
aws iam create-policy --policy-name ZDFCloudWatchWriteMetricsRaspi --policy-document file://config/cloudwatch.json
aws iam attach-user-policy --user-name ${LOGGING_AWS_IAMUSER} --policy-arn arn:aws:iam::588356231899:policy/ZDFCloudWatchWriteMetricsRaspi
aws iam create-access-key --user-name ${LOGGING_AWS_IAMUSER}



