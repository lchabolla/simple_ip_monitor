#! /bin/bash
# Author: Luis Chabolla, Jr.
# lchabolla@gmail.com
# Designed for MacOS


timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
localip=$1

if [[ $1 = 0 ]]; then # checks if localip value is empty. Uses = as localip could be a string
  echo "Error: Please enter a value. \n"
  exit 1;
else
  printf "\nPinging $1 \n\n"
fi

/sbin/ping -c 1 -q $1 # invokes ping with the count option of 1 and quieter output

if [ $? -eq 0 ] # checks ping exit status, prints if host is up or down and appends to appropriate log
then
printf "\nHost is up. Appending to log. \n\n"
echo "$timestamp: $1 is up." >> uptime.txt
exit 0;
elif [ $? -ne 0 ]
then
  printf "\nHost is down. Appending to log. \n\n"
  echo "$timestamp: $1 down." >> downtime.txt
  exit 1;
fi
