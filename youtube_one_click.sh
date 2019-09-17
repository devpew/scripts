#!/bin/bash

id=$(wmctrl -l | grep -oP "(?<=)(0x\w+)(?=.*Firefox)")
sleep 0.3
xdotool key --window $id "ctrl+l"
xdotool key --window $id "ctrl+c"

RESULT=$(xclip -o)

#echo \'$RESULT\'

#you-get -p vlc \"$RESULT\"

RRR=$(you-get -p mpv $RESULT)
echo $RRR

#you-get -p vlc 'https://www.youtube.com/watch?v=8c7QKerwmh4'

#echo you-get -p vlc \'$RESULT\'
