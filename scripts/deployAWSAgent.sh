#!/bin/bash
set -e
AWS_REGION="eu-central-1"


if [ -z "$1" ] && [ -z "$2" ]
then
    echo "No parameter given...exiting"
    exit
fi

AWS_ACTIVATION_ID=$1
AWS_ACTIVATION_CODE=$2

echo "ID: ${AWS_ACTIVATION_ID}"
echo "Code: ${AWS_ACTIVATION_CODE}"

mkdir /tmp/ssm
sudo curl https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_arm/amazon-ssm-agent.deb -o /tmp/ssm/amazon-ssm-agent.deb
sudo dpkg -i /tmp/ssm/amazon-ssm-agent.deb
sudo service amazon-ssm-agent stop
sudo amazon-ssm-agent -register -code ${AWS_ACTIVATION_CODE} -id ${AWS_ACTIVATION_ID} -region ${AWS_REGION}
sudo service amazon-ssm-agent start