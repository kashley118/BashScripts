#!/bin/bash

#Creating user account

echo -e "Creating new user account \n"
echo -n "Enter full name: "
read name
echo -n "Enter username: "
read username
read -p "Enter the user primary group: " primary_group
read -p "Enter the group(s) for user to be added to: " groups

sudo useradd -m "${username}" -c "${name}" -g "${primary_group}" -G "${groups}"


#Set Password for user
echo -e "\nPreapre to set the password for user \n"
sudo passwd ${username}

echo -e "\nUser ${username} has been created, and group(s) ${groups} has been added to profile"

