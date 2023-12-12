#!/bin/bash
# <<<<<<< HEAD
# NAMES=("web" "mongodb" "mysql" "catalogue" "redis" "user" "cart" "shipping" "rabitmq" "payment" "dispatch")
# =======
 NAMES=("web" "mongodb" "mysql" "catalogue" "redis" "user" "cart" "shipping" "rabitmq" "payment" "dispatch")
# >>>>>>> aa552b44ea5040ae3e708b4b05dbb1bcb9bdb64f
# NAMES=("cart")
IMAGE_ID=ami-03265a0778a880afb
INSTANCE_TYPE=""
SECURITY_GROUPS_ID=sg-03c28d46181dda4d6
DOMAIN_NAME=mydomainproject.tech
HOSTED_ZONE_ID=Z0811839716VA767UP90
for i in "${NAMES[@]}"
do 
  if [[ $i == "mysql" || $i == "mongodb" ]]
  then
    INSTANCE_TYPE="t3.medium"
  else
    INSTANCE_TYPE="t2.micro"
  fi
  echo "creating $i instance"
  # to create instance
  IPADDRESS=$(aws ec2 run-instances --image-id $IMAGE_ID --instance-type $INSTANCE_TYPE --security-group-ids $SECURITY_GROUPS_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" | jq -r '.Instances[0].PrivateIpAddress')
  echo "instance $i created, ipv4:$IPADDRESS"
  # creating record for the created instance in the hosted zone provided
  aws route53 change-resource-record-sets --hosted-zone-id $HOSTED_ZONE_ID --change-batch '
  {
            "Comment": "CREATE/DELETE/UPSERT a record ",
            "Changes": [{
            "Action": "CREATE",
                        "ResourceRecordSet": {
                                    "Name": "'$i.$DOMAIN_NAME'",
                                    "Type": "A",
                                    "TTL": 300,
                                 "ResourceRecords": [{ "Value": "'$IPADDRESS'"}]
            }}]
  }'
done
