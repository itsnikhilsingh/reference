import boto3


# Create CloudWatch client
cloudwatch = boto3.client('cloudwatch')

# Put custom metrics
cloudwatch.put_metric_data(
    MetricData=[
        {
            'MetricName': 'Test',
            'Dimensions': [
                {
                    'Name': 'Name',
                    'Value': 'ValueName'
                },
            ],
            'Unit': 'None',
            'Value': 1.0
        },
    ],
    Namespace='NameSpace'
)
