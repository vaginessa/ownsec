#!/bin/bash -i
# Now, you should be able to install latest node.js version through:
# Install node.js through nvm


# get login shell
# sudo -i
 
# install latest stable release and make it the default one
#nvm install stable
#nvm alias default stable
 
# or, install specific release and/or make it the default one
#sudo nvm install --lts
#sudo nvm alias default --lts

nvm install v8.9.2

sudo rm -f /usr/local/bin/node
sudo rm -f /usr/local/bin/npm

# reate symbolic links from the versions of node and npm I'm using to /usr/local/bin
sudo ln -s "$NVM_DIR/versions/node/$(nvm version)/bin/node" "/usr/local/bin/node"
sudo ln -s "$NVM_DIR/versions/node/$(nvm version)/bin/npm" "/usr/local/bin/npm"


# Then, to test if everything has been installed correctly:
# Test installed node/npm versions

node -v
npm -v
sudo node -v
sudo npm -v
