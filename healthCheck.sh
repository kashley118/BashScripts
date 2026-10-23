#!/bin/bash

echo -e "======= SYSTEM HEALTH CHECK======"
echo -e "\nDate: $(date) "
echo -e "\n====== UPTIME ======"
uptime 

echo -e "\n======= MEMORY USAGE ======"
free -h 

echo -e "\n======== DISK USAGE ======"
df -h

echo -e "\n======== FILE DISK USAGE ======"
read -p "Enter the path of the File/Directory you want to verify: " file
du -sh "${file}"

echo -e "\n====== TOP 5 CPU USAGE PROCESSES ======"
ps -eo pid,comm,%mem,%cpu --sort=-%cpu | head -n 6


