#!/bin/bash

#
# Script to bulk update config file's paths to checks
#

if [ -z ${1} ] || [ -z ${2} ]; then
    echo "Error! Usage: ${0} <Current Path or Parent-Path> <New Path>"
    echo "e.g. ${0} /usr/local/nagios/libexec /opt/nagios/nagios-plugins"
    exit 1
fi

old_path=$1
echo "old_path is: ${old_path}"

new_path=$2
echo "new_path is: ${new_path}"

for config in `ls -1 *.nrds.cfg*`; do
    
    echo ""
    echo "Updating: ${config}"
    echo ""

    sed -i "s|${old_path}|${new_path}|" ${config}

    echo ""
    echo ""
done

rm -f *.cfge
rc=$?
if [ ${rc} -ne 0 ]; then
    echo "Error removing the .cfge backup files made by sed."
    exit 1
fi

exit 0

