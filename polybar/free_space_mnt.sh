#!/bin/sh

#DIR=$(df -h /mnt/bu | grep dev | awk -F ' ' '{ print $4 }' | sed 's/\G//')
DIR=$(df -h /mnt/bu | grep dev | awk -F ' ' '{ print $4 }')
 
if [[ "${DIR}" ]]; then
  echo "${DIR}"
fi
