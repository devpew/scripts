#fileName=".png"
#SHORT=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 7 | head -n 1)
#FILENAMESHORT=$SHORT$fileName
dst="yoururl.ru"
dstPath="html"
dstAbs="/var/www/yoururl.ru/"
user="root"

#import $FILENAMESHORT
FILENAMESHORT=$1
scp -C $FILENAMESHORT $user@$dst:$dstAbs$dstPath #send screenshot through SCP(with compression enabled for low-bandwith connection) 

echo "http://yoururl.ru/"$FILENAMESHORT | xclip -i -selection clipboard #copy screenshot link to your clipboard
