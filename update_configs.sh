#!/bin/bash

#
# Script to bulk update config files
#

if [ -z ${1} ] || [ -z ${2} ]; then
    echo "Error! Usage: ${0} <DIRECTIVE> <new value>"
    echo "e.g. ${0} TOKEN ZSDJzxd2131Xao1"
    exit 1
fi

directive=$1
echo "Directive is: ${directive}"

new_value=$2
echo "new_value is: ${new_value}"

for config in `ls -1 *.cfg*`; do
    
    echo ""
    echo "Updating: ${config}"
    echo ""

    #grep -i "^${directive}" ${config} | sed -e "s|\(\"\).*\(\"\)|\1${new_value}\2|"
    # 
    # What if we wanted to update locations of check files as well ?
    # 
    # sed -i "s|\(${directive}\[A-Za-z0-9-_\]*\"\).*\(\"\)|\1${new_value}\2|" ${config}"
    #
    sed -i "s|\(${directive}=\"\).*\(\"\)|\1${new_value}\2|" ${config}

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
