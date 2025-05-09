#!/bin/bash


if ping -c 1 -W 1 1.1.1.1 &> /dev/null
then
  inet=true

elif ping -c 1 -W 1 192.168.0.11 &> /dev/null
then
  lnet=true
fi


if [ "$inet" = true ]; then
  echo '{"text": "󰖈", "class": "online"}'
elif [ "$lnet" = true ]; then
  echo '{"text": "󰍸", "class": "local"}'
else
  echo '{"text": "󰲜", "class": "offline"}'
fi
