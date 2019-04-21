#!/bin/bash

# Last mile of setting up an Amazon dev box instance

# Handy bits of info
export INSTANCE_ID=`curl --silent --connect-timeout 2 http://169.254.169.254/latest/meta-data/instance-id`
export INSTANCE_REGION=`curl --silent --connect-timeout 1 http://169.254.169.254/latest/meta-data/placement/availability-zone | sed -e 's/[a-z]$//'`

# Push the region into the config
aws configure set region $INSTANCE_REGION

# export VOLUME_ID=`aws ec2 describe-volumes --filters Name=tag-value,Values="work" --query 'Volumes[*].{ID:VolumeId}' --output text`

# Attach work volume
if [ ! -z "$EBS_VOLUME_ID" ] ; then
  aws ec2 attach-volume --volume-id $EBS_VOLUME_ID --instance-id $INSTANCE_ID --device /dev/sdb
  mount -a
fi

# Create local ssh key
# if [ ! -f ~/.ssh/id_ec2_rsa ] ; then
#   ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_ec2_rsa -q -N ""
# fi

# Grab my public address
if [ ! -z "$ELASTIC_PUBLIC_ID" ] ; then
  aws ec2 associate-address --public-ip $ELASTIC_PUBLIC_ID --instance-id $INSTANCE_ID
fi
