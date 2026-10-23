#!/bin/bash

#Verify the firewall rules
sudo ufw status numbered
read -p "Enter the number(s) of UFW rule(s) you want to delete: " choices

if [[!${choices} =~ ^[0-9]+$ ]]; then
	echo "Invalid input. ${choices} is not a valid rule number. Exiting"
	exit 1
fi

choices_array=${choices}
choices_array=($(for choice in "${choices_array[@]}"; do echo $choice; done | sort -r))

read -p "Are you sure you want to delete the rule(s) selected? Enter yes or no: " confirm

if [["${confirm}" != "yes" ]]; then
	echo "Cancelling deletion "
	exit 0
fi

for choice in "${choices_array[@]}"; do
	sudo ufw delete ${choice}
	
	if [ $? -eq 0 ]; then
		echo "The rule number ${choice} has been deleted successfully"
		
	else
		echo "Deletion failed"
		
	fi
done
