#!/bin/bash

############## Vagrant #######################

echo -e "\e[36m Install vagrant \e[0m"

VAGRANT_PACKAGE_NAME=vagrant_2.2.14_x86_64.deb

echo -e "\e[33m [Vagrant] Download package \e[0m"
wget https://releases.hashicorp.com/vagrant/2.2.14/"${VAGRANT_PACKAGE_NAME}"

echo -e "\e[33m [Vagrant] Install package \e[0m"
sudo dpkg -i "${VAGRANT_PACKAGE_NAME}"

echo -e "\e[33m [Vagrant] Remove package \e[0m"
rm -f "${VAGRANT_PACKAGE_NAME}"

############## Virtual box ####################

echo -e "\e[36m Install virtual box \e[0m"
sudo apt-get install virtualbox

############## Linux headers ##################

echo -e "\e[36m Install linux-headers \e[0m"

echo -e "\e[33m [Linux-headers] Install headers \e[0m"
sudo apt-get install linux-headers-"$(uname -r)"
