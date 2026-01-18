#!/bin/zsh
if (ip link show enp0s31f6 | grep -q "state UP") || (ip link show wlan0 | grep -q "state UP"); then
	eval "dig +short myip.opendns.com @resolver1.opendns.com"
elif (ip link show enp0s31f6 | grep -q "state UP") && (ip link show wlan0 | grep -q "state UP"); then
	echo "Both connected"
else

fi
