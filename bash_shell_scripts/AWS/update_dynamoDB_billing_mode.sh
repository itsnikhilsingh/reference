#!/bin/bash

TABLE_NAME=$(aws dynamodb list-tables | cut -d '"' -f 2)

FILTER_names=($TABLE_NAME )
#echo "$sqs_name"
#echo ""

for table_name in "${FILTER_names[@]}"
do
  echo $table_name
  out=$(aws dynamodb describe-table --table-name $table_name --query 'Table.BillingModeSummary.BillingMode')
  if [ "$out" = "null" ]; then
    aws dynamodb update-table --table-name $table_name --billing-mode PAY_PER_REQUEST
    echo ""
  fi
done
