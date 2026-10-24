#!/bin/bash
#Verify if a specific service is running and if it is not running, the script will enable it and start running it.

read -p "Enter the Service(s) you want to verify and ensure that it's running: " services

IFS="," read -ra services <<< "${services}"

for service in "${services[@]}"; do
	if systemctl is-active --quiet "${service}"; then
		echo "${service} is running"
		
	else
		echo "${service} are not running and we are going to run them"
		systemctl enable "${service}"
		systemctl start "${service}"
		systemctl is-active "${service}"
		if systemctl is-active --quiet "${service}"; then
			echo "${service} has been enabled and is now running"
		else
			echo "${service} failed to start"
		fi
			
			
	fi
	
done

