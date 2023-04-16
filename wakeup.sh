#!/bin/bash

devices=(
    "AA:BB:CC:DD:EE:FF"
	"11:22:33:44:55:66"
)

echo "Select device to wakeup or enter MAC manually:"
for ((i=0; i<${#devices[@]}; i++)); do
    echo "$i) ${devices[$i]}"
done
echo "a) Enter MAC"
echo "q) Quit"

read choice
if [[ $choice == "q" ]]; then
    exit 0
elif [[ $choice == "a" ]]; then
    read -p "Input MAC: " mac_address
    sudo wakeonlan $mac_address
elif (( $choice >= 0 && $choice < ${#devices[@]} )); then
    echo "Selected: ${devices[$choice]}"
    sudo wakeonlan ${devices[$choice]}
else
    echo "Invalid selection."
    exit 1
fi
