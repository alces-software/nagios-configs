#!/bin/bash

if [ -z $1 ] || [ -z $2 ]; then
    echo "Error! Usage: $0 <Plugin filename> <Plugin Arguments> <service_description>"
    echo "e.g. $0 check_uptime.sh.sh 30 Check Uptime"
    exit 1
fi

parent_dir="/opt/nagios/nagios-plugins"
check_name=$1
check_arguments=$2
service_description=$3

echo "Adding: ${parent_dir}/${check_name} to ALL configs"

for config in `ls -1 *.nrds.cfg*`; do
    echo "command[${service_description}]=${parent_dir}/${check_name} ${check_arguments}" >> ${config}
done

exit 0
