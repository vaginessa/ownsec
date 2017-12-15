#!/bin/sh

# get login shell
# sudo -i
 
# install compilers and other essential tools
sudo apt-get -y install gcc make curl git python python-dev libssl-dev build-essential  

# The nvm setup is extremely easy through the creationx script.To install nvm globally, you need to add a couple of environment variables during default setup. Just execute this:
# Install nvm

# get login shell
# sudo -i
 

mkdir /opt/DEPS/nvm/creationix
cd /opt/DEPS/nvm/creationix
# fetch and execute nvm setup script (you need to be connected to the internet) 
NVM_DIR=/opt/DEPS/nvm/creationix/nvm 
wget  https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh

chmod +x install.sh
./install.sh
sudo rm -f install.sh


#  After the installation succeeds, you need to logout/login or create a new terminal session to apply changes.



#BRANCH=master
#GITREPOROOT=https://github.com/creationix/nvm
#GITCLONEDIR=#

# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash

# nvm install --lts

#n=$(which node); \
#n=${n%/bin/node}; \
#chmod -R 755 $n/bin/*; \
#sudo cp -r $n/{bin,lib,share} /usr/local

#The above command is a bit complicated, 
#but all it's doing is copying whatever version of node you have active via nvm into the /usr/local/ directory 
#(where user installed global files should live on a linux VPS) and setting the permissions so that all users can access them.
# https://stackoverflow.com/a/29903645/1800885

# credits: http://www.marcominetti.net/personal/blog/2015/09/install-system-wide-node-js-with-nvm-the-painless-way