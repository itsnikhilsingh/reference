import boto3
import pprint

cloudwatch = boto3.client('cloudwatch')
aws_regions = ['us-east-1']
for region in aws_regions:
    #result = " "
    paginator = cloudwatch.get_paginator('describe_alarms')
    for response in paginator.paginate(StateValue='ALARM'):
        result = ""
        for name in response['MetricAlarms']:
            #print(type(name['AlarmName']))
            alarms = name['AlarmName'] + " "
            result += alarms
        print(result)
