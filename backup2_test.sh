#!/bin/bash

USER="dm"
EMAIL="devpew"

NOW=$(date +%Y%m%d%H%M)
YESTERDAY=$(date --date="-1 day" +%Y%m%d)

BACKUP_HOME="/home/dm/butest2"
CURRENT_LINK="$BACKUP_HOME/current"
SNAPSHOT_DIR="$BACKUP_HOME/snapshots"
ARCHIVES_DIR="$BACKUP_HOME/archives"

BACKUP_SOURCE_DIR="/home/$USER/butest"

mkdir -p $SNAPSHOT_DIR  $ARCHIVES_DIR &> /dev/null

rsync -azH --link-dest=$CURRENT_LINK  $BACKUP_SOURCE_DIR $SNAPSHOT_DIR/$NOW \
  && ln -snf $(ls -1d $SNAPSHOT_DIR/* | tail -n1) $CURRENT_LINK

if [ $(ls -d $SNAPSHOT_DIR/$YESTERDAY* 2> /dev/null | wc -l) != "0" ]
then
  tar -czf $ARCHIVES_DIR/$YESTERDAY.tar.gz $SNAPSHOT_DIR/$YESTERDAY* \
    && rm -rf $SNAPSHOT_DIR/$YESTERDAY*
fi

if [ $(ls -d $ARCHIVES_DIR/*.tar.gz 2> /dev/null | wc -l) != "0" ]
then
  gpg -r $EMAIL --encrypt-files $ARCHIVES_DIR/*.tar.gz \
    && rm -rf $ARCHIVES_DIR/*.tar.gz
fi
