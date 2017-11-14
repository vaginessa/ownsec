#!/bin/bash


sudo rm -rf /opt/DEPS/virtualbox
mkdir -p /opt/DEPS/virtualbox


bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
__     _____ ____ _____ _   _   _    _     ____   _____  __
\ \   / /_ _|  _ \_   _| | | | / \  | |   | __ ) / _ \ \/ /
 \ \ / / | || |_) || | | | | |/ _ \ | |   |  _ \| | | \  / 
  \ V /  | ||  _ < | | | |_| / ___ \| |___| |_) | |_| /  \ 
   \_/  |___|_| \_\|_|  \___/_/   \_\_____|____/ \___/_/\_\
  
${normal}"


cd /opt/DEPS
sudo rm -r virtualbox
mkdir virtualbox
cd virtualbox
wget http://download.virtualbox.org/virtualbox/5.2.0/virtualbox-5.2_5.2.0-118431~Ubuntu~xenial_amd64.deb
yes | sudo dpkg -i virtualbox-5.2_5.2.0-118431~Ubuntu~xenial_amd64.deb

#wget http://download.virtualbox.org/virtualbox/5.2.0/Oracle_VM_VirtualBox_Extension_Pack-5.2.0-118431.vbox-extpack
#yes | sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-5.2.0-118431.vbox-extpack
