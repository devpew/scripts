#!/bin/bash -e

ls -lA | awk -F':[0-9]* ' '/:/{print $2}'
