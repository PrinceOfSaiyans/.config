#!/bin/bash

STATE_FILE="/tmp/polybar_toggle_state" # File to store the toggle state

# Initialize state if file doesn't exist
if [ ! -f "$STATE_FILE" ]; then
    echo "off" > "$STATE_FILE"
fi

# Function to toggle the state
toggle_state() {
    CURRENT_STATE=$(cat "$STATE_FILE")
    if [ "$CURRENT_STATE" == "on" ]; then
    	sudo killall -s SIGTERM openvpn
    	echo "off" > "$STATE_FILE"
    else
	sudo openvpn --config /home/pingu/OpenVPN/Canada/us-ca91.nordvpn.com.udp.ovpn &
        echo "on" > "$STATE_FILE"
    fi
}

# Handle arguments for toggling
if [ "$1" == "--toggle" ]; then
    toggle_state
fi

# Output content based on current state
CURRENT_STATE=$(cat "$STATE_FILE")
if [ "$CURRENT_STATE" == "on" ]; then
    PUBADDR=$(~/.config/polybar/scripts/mypubip.sh)
    echo " $PUBADDR"
else
    PUBADDR=$(~/.config/polybar/scripts/mypubip.sh)
    echo " $PUBADDR"
fi
