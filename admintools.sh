#!/bin/bash

# This script is designed to assist administrators with common tasks.

# Function to check system information.
system_info() {
  clear
  echo -e "\nSystem Information:\n"
  echo "Hostname: $(hostname)"
  echo "Operating system: $(cat /etc/os-release | grep -E '^PRETTY_NAME=' | cut -d= -f2 | sed 's/"//g')"
  echo "Kernel version: $(uname -r)"
  echo "CPU architecture: $(uname -m)"
  echo "Total memory: $(free -h | awk '/^Mem/ {print $2}')"
  echo "Total disk space: $(df -h --total | awk '/^total/ {print $2}')"
}

# Function to check disk usage by directory.
disk_usage() {
  clear
  echo -e "\nDisk Usage by Directory:\n"
  read -p "Enter the path to the directory to check: " path
  if [ -d "$path" ]; then
    du -h --max-depth=1 "$path"
  else
    echo "Error: Directory not found."
  fi
}

# Function to list processes by memory usage.
processes_by_memory() {
  clear
  echo -e "\nProcesses by Memory Usage:\n"
  ps aux --sort=-%mem | head -n 11
}

# Function to list processes by CPU usage
processes_by_cpu() {
  clear
  echo -e "\nProcesses by CPU Usage:\n"
  ps aux --sort=-%cpu | head -n 11
}

# Function to check network connections
network_connections() {
  clear
  echo -e "\nNetwork Connections:\n"
  netstat -natp
}

# Function to check system uptime
system_uptime() {
  clear
  echo -e "\nSystem Uptime:\n"
  uptime
}

# Function to check logged in users
logged_in_users() {
  clear
  echo -e "\nLogged in Users:\n"
  who
}

# Function to check disk space usage
disk_space_usage() {
  clear
  echo -e "\nDisk Space Usage:\n"
  df -h
}

# Function to check system load
system_load() {
  clear
  echo -e "\nSystem Load:\n"
  w
}

# Main menu for the script.
while true; do
  clear
  echo "============================================="
  echo "|              Administrator Menu            |"
  echo "============================================="
  echo "| Options:                                  |"
  echo "| 1. Check System Information                |"
  echo "| 2. Check Disk Usage by Directory           |"
  echo "| 3. List Processes by Memory Usage          |"
  echo "| 4. List Processes by CPU Usage             |"
  echo "| 5. Check Network Connections               |"
  echo "| 6. Check System Uptime                     |"
  echo "| 7. Check Logged in Users                   |"
  echo "| 8. Check Disk Space Usage                  |"
  echo "| 9. Check System Load                       |"
  echo "| 10. Exit                                   |"
  echo "============================================="
  read -p "Option: " option

  case $option in
    1) system_info ;;
    2) disk_usage ;;
    3) processes_by_memory ;;
    4) processes_by_cpu ;;
    5) network_connections ;;
    6) system_uptime ;;
    7) logged_in_users ;;
	8) disk_space_usage ;;
	9) system_load ;;
	10) exit ;;
	*) echo "Invalid option. Please choose a valid option from the menu." ;;
esac

	read -p "Press enter to continue..."
	done
