#!/bin/bash

# Copy CW Metrics across account in AWS

read -p 'Source log group name: ' srclgname
read -p 'Destination log group name: ' destlgname

#TO GET FILTER NAMES FROM THE SOURCE LOG GREOUP
filter_name=$(aws logs describe-metric-filters --log-group-name   $srclgname --profile staging --region us-east-1  | grep filterName | cut -d ':' -f 2 | sed 's/,//g' | sed 's/"//g'|sed '/^$/d;s/[[:blank:]]//g')

FILTER_names=($filter_name )
echo "$filter_name"
echo ""

for filter in "${FILTER_names[@]}"
do
        #ENABLE BELOW echo FOR DEBURG
        #echo aws logs describe-metric-filters --log-group-name $srclgname --filter-name-prefix $filter
        aws logs describe-metric-filters --log-group-name $srclgname --filter-name-prefix $filter --profile staging --region us-east-1 | sed '1d' | sed '1d' | sed '10d'| sed '13d'| sed '13d'  > test.json
        aws logs put-metric-filter --log-group-name $destlgname  --filter-name $filter --profile prod --region us-east-1 --cli-input-json file://test.json

done
