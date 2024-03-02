t#!/bin/bash

TABLE_NAME=$(aws dynamodb list-tables --output text |awk '{print $2}'re)

FILTER_names=($TABLE_NAME )
#echo "$sqs_name"
#echo ""
region='us-east-1'
accountID='xxxxxxx'
arn="arn:aws:dynamodb:$region:$accountID:table"

for table_name in "${FILTER_names[@]}"
do
  aws dynamodb tag-resource --resource-arn $arn/$table_name  --tags Key=Name,Value=$table_name
done
