#!/bin/bash
FLAG=/home/filekeeper/flag.txt
FILE=/home/filekeeper/key.txt
while true
do
  if [ ! -f "$FLAG" ]; then
    if [ -f "$FILE" ] ; then
      cp /root/flag.txt /home/filekeeper/flag.txt && chmod 777 /home/filekeeper/flag.txt
    fi
  fi
  sleep 10
done
