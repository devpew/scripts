#!/bin/bash

#DIR=$(ssh -p 4562 -t dm@192.168.0.112 df -h /mnt/media | grep dev | awk -F ' ' '{ print $4 }' | sed 's/\G//')
DIR=$(ssh -o LogLevel=QUIET -tt pi@192.168.0.155 tail -2 /home/pi/temphum.txt | head -1 | sed 's/[^ ]* //')  

if [[ "${DIR}" ]]; then
  echo "${DIR}"
fi
