#!/bin/bash

while :
do
  TABLE_NAME=$(aws dynamodb list-tables | grep <filtername> | cut -d '"' -f 2)

  FILTER_names=($TABLE_NAME )
  #echo "$sqs_name"
  #echo ""

  for table_name in "${FILTER_names[@]}"
  do
     aws dynamodb delete-table --table-name $table_name
  done
done
