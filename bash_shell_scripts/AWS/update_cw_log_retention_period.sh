#!/bin/bash
echo "Enter the loggroupName."
read lgname
echo "Current retention period is."
/usr/bin/aws logs describe-log-groups --log-group-name $lgname |grep retentionInDays


/usr/bin/aws logs describe-log-groups --log-group-name $lgname |grep logGroupName|cut -d"\"" -f4 > /tmp/loggroupname.txt


echo "Enter retention period in days."
read retn

while IFS= read line
do
echo "Changing retention period of: "$line " to: "$retn Days
/usr/bin/aws logs put-retention-policy --log-group-name $line --retention-in-days $retn


done < /tmp/loggroupname.txt
