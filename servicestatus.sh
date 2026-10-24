#!/bin/bash

read -p "Enter the Service(s) you want to verify and ensure that it's running: " services

IFS="," read -ra services <<< "${services}"

for services in "${services[@]}"; do
	if systemctl is-active --quiet "${services}"; then
		echo "${services} is running"
		
	else
		echo "${services} are not running and we are going to run them"
		systemctl enable "${services}"
		systemctl start "${services}"
		systemctl is-active "${services}"
		if systemctl is-active --quiet "${services}"; then
			echo "${services} has been enabled and is now running"
		else
			echo "${services} failed to start"
		fi
			
			
	fi
	
done

