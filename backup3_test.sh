#!/bin/bash
dest="/home/dm/bu1"

files=( "/home/dm/bu2" "/home/dm/bu3" "/home/dm/bu4" "/home/dm/bu5" )
day=$(date +%A)
hostname=$(hostname -s)
archive_file="$hostname-TEST-$day.tgz"


for i in "${files[@]}"
do    echo "Backing up $i to $dest/$archive_file"
    date
    echo

    tar czf $dest/$archive_file $i 
done

echo
echo "Backup finished"
