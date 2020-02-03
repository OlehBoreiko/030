#!/bin/bash

#author: Oleh Boreiko

#IP range
ip_range=$@

#ports to check
ports="80\n443"

# Check if any parameteres given
if [ $# -eq 0 ]; then
    echo "No parameteres provided! Please run the script as the following example:"
    echo "./net-scan.sh 192.168.1.{0..255}"
    exit 1
fi

#Checking ports for the specified IP range and print only "succeeded"

echo "Scanning..."

for ip in $ip_range; do 
    echo -e $ports | xargs -i nc -w 1 -zvn $ip {} 2>&1 | grep succeeded
done
