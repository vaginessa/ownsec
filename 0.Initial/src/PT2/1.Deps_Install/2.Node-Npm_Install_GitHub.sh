#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _  ___  ____  _____ 
| \ | |/ _ \|  _ \| ____|
|  \| | | | | | | |  _|  
| |\  | |_| | |_| | |___ 
|_| \_|\___/|____/|_____|
               
${normal}"
echo "${bold}
THIS WILL TAKE A WHILE, APROX 15 MINUTES            
${normal}"

sudo rm -r /opt/DEPS/node/nodejs
mkdir -p /opt/DEPS/node/nodejs
cd /opt/DEPS/node/nodejs
git clone https://github.com/nodejs/node.git



cd /opt/DEPS/node/nodejs/node 

#sudo make uninstall
#make clean
#git clean -f 
#it fetch origin
#git reset --hard origin/v7.x
#git pull
git checkout v8.9.2
#git checkout v7.x
git pull
./configure
make -j 4 
sudo make install


echo "${bold}
 _   _ ____  __  __ 
| \ | |  _ \|  \/  |
|  \| | |_) | |\/| |
| |\  |  __/| |  | |
|_| \_|_|   |_|  |_|
               
${normal}"


mkdir -p /opt/DEPS/npm/npm
cd /opt/DEPS/npm/npm
git clone https://github.com/npm/npm.git
cd npm

sudo make uninstall
#make clean
#git clean -f 
#git fetch origin
#git reset --hard origin/$BRANCH
#git pull
#git checkout latest
git checkout v4.2.0
./configure 
make -j 4
sudo make install


sudo updatedb
sudo ldconfig