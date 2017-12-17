#!/bin/bash

# https://github.com/golang/go/wiki/Ubuntu

echo "${bold}
  ____  ___  
 / ___|/ _ \ 
| |  _| | | |
| |_| | |_| |
 \____|\___/ 
              
INSTALL PPA:gophers
${normal}"

sudo apt-get update
sudo apt-get upgrade
yes Y | sudo add-apt-repository ppa:gophers/archive
sudo apt-get update
sudo apt-get install golang-1.9-go
sudo updatedb
sudo ldconfig

# Del envi vars from old instllations
perl -ni.bak -e "print unless /export GOPATH=/" /home/$USER/.profile
perl -ni.bak -e "print unless /export GOROOT=/" /home/$USER/.profile
perl -ni.bak -e "print unless /export PATH=$GOPATH/" /home/$USER/.profile

# Create new entries, pass the function names as is not the path
echo 'export GOPATH=/home/xUSER/go"' >> /home/$USER/.profile
echo 'export GOROOT=/usr/lib/go-1.9"' >> /home/$USER/.profile
echo 'export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"' >> /home/$USER/.profile
source /home/$USER/.profile

# Rm duplicates
awk '!NF || !seen[$0]++' /home/$USER/.profile > /home/$USER/.profile_new && mv /home/$USER/.profile_new /home/$USER/.profile

# Debug
cat /home/$USER/.profile