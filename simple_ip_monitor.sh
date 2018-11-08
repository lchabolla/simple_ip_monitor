#! /bin/bash
# Author: lchabolla@gmail.com
# The goal of this script is to ping an IP and log any failures with a timestamp

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
localip=$1

if [[$1 -eq 0]]
then
  echo "Error: Please enter valid IP address."
  exit 1;
elif
/sbin/ping -c 1 $1
if [ $? -eq 0 ]
then
echo "$timestamp: up" >> uptime.txt
elif [ $? -ne 0 ]
then
echo "$timestamp: down" >> downtime.txt
exit 1;
fi
