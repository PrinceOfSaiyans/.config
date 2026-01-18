#!/bin/zsh
QUERRY=$(~/.config/polybar/scripts/mypubip.sh)
eval "curl -s ipinfo.io/$QUERRY" | grep city | sed -E 's/.*"city": "([^"]*)".*/\1/'
