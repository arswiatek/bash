#!/bin/bash

# Define colors for pretty output
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
RESET="\033[0m"

# Define functions for each tool
function ping_tool() {
    read -p "Enter the host or IP address to ping: " host
    ping -c 5 $host
}

function traceroute_tool() {
    read -p "Enter the host or IP address to trace: " host
    traceroute $host
}

function netstat_tool() {
    netstat -an
}

function ifconfig_tool() {
    ifconfig
}

function dig_tool() {
    read -p "Enter the domain name to look up: " domain
    dig $domain
}

function nslookup_tool() {
    read -p "Enter the host or IP address to lookup: " host
    nslookup $host
}

function tcpdump_tool() {
    sudo tcpdump -i any -n
}

function route_tool() {
    route -n
}

function arp_tool() {
    arp -a
}

function ss_tool() {
    ss -tunap
}

function mtr_tool() {
    read -p "Enter the host or IP address to trace: " host
    mtr $host
}

function iperf_tool() {
    read -p "Enter the server IP address: " server
    iperf3 -c $server
}

function nmap_tool() {
    read -p "Enter the target IP address or hostname: " target
    nmap $target
}

function wget_tool() {
    read -p "Enter the URL to download: " url
    wget $url
}

function speedtest_tool() {
    speedtest-cli
}

# Define menu options
menu_options=(
    "Ping"
    "Traceroute"
    "Netstat"
    "Ifconfig"
    "Dig"
    "Nslookup"
    "Tcpdump"
    "Route"
    "ARP"
    "SS"
    "MTR"
    "iperf"
    "Nmap"
    "Wget"
    "Speedtest"
    "Exit"
)

# Define function to print menu
function print_menu() {
    clear
    echo -e "${YELLOW}Network Tools Menu${RESET}\n"
    for ((i=0; i<${#menu_options[@]}; i++)); do
        printf "%-2s) %s\n" $((i+1)) "${menu_options[i]}"
    done
    echo ""
}

# Define function to handle user input
function handle_input() {
    read -p "Select an option: " choice
    case $choice in
        1) ping_tool ;;
        2) traceroute_tool ;;
        3) netstat_tool ;;
        4) ifconfig_tool ;;
        5) dig_tool ;;
        6) nslookup_tool ;;
        7) tcpdump_tool ;;
        8) route_tool ;;
        9) arp_tool ;;
        10) ss_tool ;;
        11) mtr_tool ;;
        12) iperf_tool ;;
        13) nmap_tool ;;
        14) wget_tool ;;
        15) speedtest_tool ;;
        16) echo -e "${GREEN}Exiting...${RESET}" && exit ;;
        *) echo -e "${RED}Invalid option. Please try again.${RESET}" ;;
    esac
    read -p "Press [Enter] to continue..."
}

# Run menu loop
while true; do
    print_menu
    handle_input
done