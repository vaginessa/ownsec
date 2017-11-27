#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
__     _____ ____ _____ _   _   _    _     ____   _____  __
\ \   / /_ _|  _ \_   _| | | | / \  | |   | __ ) / _ \ \/ /
 \ \ / / | || |_) || | | | | |/ _ \ | |   |  _ \| | | \  / 
  \ V /  | ||  _ < | | | |_| / ___ \| |___| |_) | |_| /  \ 
   \_/  |___|_| \_\|_|  \___/_/   \_\_____|____/ \___/_/\_\
  
${normal}"

sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" >> /etc/apt/sources.list.d/virtualbox.list' 
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install VirtualBox-5.2