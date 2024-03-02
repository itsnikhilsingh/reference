import boto3

client = boto3.client('ec2', region_name='us-east-1')
#ec2 = boto3.resource('ec2')
ec2_regions = [region['RegionName'] for region in client.describe_regions()['Regions']]


for region in ec2_regions:
    conn = boto3.resource('ec2', region_name=region)
    instances = conn.instances.all()
    for instance in instances:
      print(
            "Id: {0}\nPlatform: {1}\nType: {2}\nPublic IPv4: {3}\nAMI: {4}\nState: {5}\n Region: {6}\n".format(
            instance.id, instance.platform, instance.instance_type, instance.public_ip_address, instance.image.id, instance.state, region
           )
        )
