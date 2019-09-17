#!/bin/bash

NOW=$(date +%Y%m%d%H%M)
MNOW=$(date +%Y%m)

BACKUP_HOME="/mnt/bu/backup"
EMAIL="devpew"
ARCHIVES_DIR="$BACKUP_HOME/archives"


tar --exclude='/home/dm/.local/share/Steam' --exclude='/home/dm/.POD' --exclude='/home/dm/.tor-browser-en' --exclude='/home/dm/Dropbox' --exclude='/home/dm/Nextcloud' --exclude='/home/dm/Downloads' --exclude='/home/dm/backup' --exclude='/home/dm/.dbus' --exclude='/home/dm/.gvfs' --exclude='/home/dm/.cache' --exclude='/home/dm/.cache/dconf' --exclude='/home/dm/.dropbox' -z --create --file /mnt/bu/backup/$NOW.tar.gz --listed-incremental=/mnt/bu/backup/$MNOW.snar /home/dm 

if [ $(ls -d /mnt/bu/backup/*.tar.gz 2> /dev/null | wc -l) != "0" ]
then
  gpg -r $EMAIL --encrypt-files /mnt/bu/backup/*.tar.gz \
    && rm -rf /mnt/bu/backup/*.tar.gz
fi

scp -P port /mnt/bu/backup/$NOW.tar.gz.gpg /mnt/bu/backup/$MNOW.snar user@ip:/mnt/media/backup/x1arch