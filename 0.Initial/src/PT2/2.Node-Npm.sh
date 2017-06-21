#!/bin/bash

#Node git install
mkdir -p /opt/DEPS/node/nodejs
sudo chown -R $USER:$USER /opt
cd /opt/DEPS/node/nodejs
git clone https://github.com/nodejs/node.git
cd node 

make clean
git clean -f 
git fetch origin
git reset --hard origin/v7.x
git pull
git checkout v7.x
./configure
make -j 4 
sudo make install
node -v


#NPM git install

mkdir -p /opt/DEPS/npm/npm
sudo chown -R $USER:$USER /opt
cd /opt/DEPS/npm/npm
git clone https://github.com/npm/npm.git
cd npm

make clean
git clean -f 
git fetch origin
git reset --hard origin/latest
git pull
git checkout latest
./configure 
make -j 4
sudo make install
npm -v

sudo udpatedb
sudo ldconfig

