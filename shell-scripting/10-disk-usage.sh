#!/bin/bash

LOG_DIRECTORY=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOG_DIRECTORY/$DATE-$SCRIPT_NAME.log

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=2

 while IFS= read line 
  do
    usage=$(echo $line | awk '{print $6}' | cut -d % -f1)
#   echo "$usage"
    partition=$(echo $line | awk '{print $1}')
    # echo "$partition"
    if [ $usage -ge $DISK_USAGE_THRESHOLD ]
    then
      echo "limit exceeded: $partition:$usage%"
    fi
 done <<< $DISK_USAGE
