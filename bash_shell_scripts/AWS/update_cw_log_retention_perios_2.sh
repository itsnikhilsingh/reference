#!/bin/bash

LOG_NAME=$(aws logs describe-log-groups | grep logGroupName | cut -d '"' -f 4)
FILTER_names=($LOG_NAME )
#echo "$sqs_name"
#echo ""

for log_name in "${FILTER_names[@]}"
do
  echo $log_name
  aws logs put-retention-policy --log-group-name $log_name --retention-in-days 3
done
