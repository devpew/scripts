#!/bin/sh

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(yay -Qum | wc -l); then
# if ! updates_aur=$(cower -u 2> /dev/null | wc -l); then
# if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
    updates_aur=0
fi

updates=$(("$updates_arch" + "$updates_aur"))

#if [ "$updates" -gt 0 ]; then
#    echo "# $updates"
#else
#    echo ""
#fi


re='^[0-9]+$'
if ! [[ $updates_arch =~ $re ]] ; then
   updates_aur=999; exit 1
fi

if ! [[ $updates_arch =~ $re ]] ; then
   updates_aur=999; exit 1
fi


echo P:$updates_arch Y:$updates_aur
