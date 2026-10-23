#!/bin/bash

#Creating user account

echo -e "Creating new user account \n"
echo -n "Enter full name: "
read name
echo -n "Enter username: "
read username

sudo useradd -m "${username}" -c "${name}" 

#Add user to a supplement group
echo -e "\nAdd user to a supplementary group"
read -p "Enter the group(s) for user to be added to: " groups

sudo usermod "${username}" -aG "${groups}" 

#Set Password for user
echo -e "\nPreapre to set the password for user \n"
sudo passwd ${username}

echo -e "\nUser ${username} has been created, and group(s) ${groups} has been added to profile"

