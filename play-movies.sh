#!/bin/bash
SDA= cat /tmp/play-files.txt
MNT=''
while [ ${#SDA} -lt 1 ]
do
  SDA=$(cat /tmp/play-files.txt)
  sleep 1
done
sudo rm /tmp/play-files.txt
MNT=''
while [ ${#MNT} -lt 1 ]
do
  MNT=$(lsblk -n /dev/$SDA --output MOUNTPOINT)
  sleep 1
done
loggedin=$(users)
echo "PLAY FILES $MNT"
runuser -l $loggedin -c "cvlc --x11-display :0 -fL $MNT"


