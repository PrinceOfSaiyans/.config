#!/bin/bash

STATE_FILE="/tmp/polybar_firewall_toggle_state" # File to store the toggle state

# Initialize state if file doesn't exist
if [ ! -f "$STATE_FILE" ]; then
    echo "off" > "$STATE_FILE"
fi
# Function to toggle the state
toggle_state() {
    CURRENT_STATE=$(cat "$STATE_FILE")
    if [ "$CURRENT_STATE" == "on" ]; then
        sudo iptables -F &
	sudo ip6tables -F &
	echo "off" > "$STATE_FILE"
    else
        sudo iptables-restore < /home/pingu/.config/iptables/ruleset.txt &
	    sudo ip6tables-restore < home/pingu/.config/iptables/ruleset6.txt &
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
    echo " "
else
    echo " "
fi
