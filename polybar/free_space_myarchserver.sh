#!/bin/bash

#DIR=$(ssh -p 4562 -t dm@192.168.0.112 df -h /mnt/media | grep dev | awk -F ' ' '{ print $4 }' | sed 's/\G//')
DIR=$(ssh -p port -o LogLevel=QUIET -tt user@ip df -h /mnt/media | grep dev | awk -F ' ' '{ print $4 }')  

if [[ "${DIR}" ]]; then
  echo "${DIR}"
fi
