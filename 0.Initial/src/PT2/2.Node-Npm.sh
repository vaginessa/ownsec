#!/bin/bash

mkdir -p /opt/DEPS/node/nodejs
cd /opt/DEPS/node/nodejs
git clone https://github.com/nodejs/node.git
cd node 

sudo make uninstall
#make clean
#git clean -f 
#git fetch origin
#git reset --hard origin/v7.x
#git pull
#git checkout v7.x
#./configure
#make -j 4 
sudo make install


mkdir -p /opt/DEPS/npm/npm
cd /opt/DEPS/npm/npm
git clone https://github.com/npm/npm.git
cd npm

sudo make uninstall
make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git checkout latest
./configure 
make -j 4
sudo make install


sudo udpatedb
sudo ldconfig

