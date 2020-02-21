#!/bin/bash

OUTPUT=$(/usr/bin/vcgencmd measure_temp)
CUTOUT=$(echo ${OUTPUT:5} | cut -f1 -d\')

PIHOST=$(hostname)

aws cloudwatch put-metric-data --metric-name CPUTemp --namespace "RASPBERRY" --value "$CUTOUT" --timestamp "$(date -Is)" --region eu-central-1 --dimensions "Host=$PIHOST"
