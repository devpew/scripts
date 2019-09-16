fileDate=`date +%Y-%m-%d-%H-%M-%S`
machineName=`hostname`
fileName=".png"
FILENAME=$fileDate"-"$machineName$fileName
SHORT=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 7 | head -n 1)
FILENAMESHORT=$fileDate$fileName

import $FILENAMESHORT

