#! /bin/bash
# Author: lchabolla@gmail.com


timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
localip="$1"

if [[ "$1" = 0 ]]; then
  echo "Error: Please enter valid IP address."
  exit 1;
else
  echo "Pinging $1"
fi

/sbin/ping -c 1 $1

if [ $? -eq 0 ]
then
echo "Host is up. Appending to log."
echo "$timestamp: $1 is up." >> uptime.txt
exit 0;
elif [ $? -ne 0 ]
then
  echo "Host is down. Appending to log."
  echo "$timestamp: $1 down." >> downtime.txt
  exit 1;
fi
