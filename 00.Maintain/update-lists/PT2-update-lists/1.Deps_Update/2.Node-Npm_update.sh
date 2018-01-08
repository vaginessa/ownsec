#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

# node install func
GITREPO_node=https://github.com/nodejs/node.git
BRANCH_node=v8.x
BRANCHTAG_node=v8.9.2
GITREPOROOT_node=/opt/DEPS/node/nodejs/node
GITCONFDIR_node=/opt/DEPS/node/nodejs/node/.git
GITCLONEDIR_node=/opt/DEPS/node/nodejs
GITRESET_NODE () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH_node
	git checkout tags/$BRANCHTAG_node
	git pull
}

# npm func
GITREPO_npm=https://github.com/nodejs/node.git
BRANCH_npm=latest
BRANCHTAG_npm=v4.2.0
GITREPOROOT_npm=/opt/DEPS/npm/npm/npm
GITCONFDIR_npm=/opt/DEPS/npm/npm/npm/.git
GITCLONEDIR_npm=/opt/DEPS/npm/npm
GITRESET_NPM () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH_npm
	git checkout tags/$BRANCHTAG_npm
	git pull
}

# general func
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}


### node install start
echo "${bold}
 _   _  ___  ____  _____ 
| \ | |/ _ \|  _ \| ____|
|  \| | | | | | | |  _|  
| |\  | |_| | |_| | |___ 
|_| \_|\___/|____/|_____|
               
UPDATE
${normal}"
echo "${bold}
Compiling Node WILL TAKE A WHILE, APROX 15 MINUTES on i5 netbook w ssd          
${normal}"

if [ ! -d $GITCONFDIR ]

then

mkdir -p $GITCLONEDIR_node
cd $GITCLONEDIR_node
git clone --branch $BRANCHTAG_node $GITREPO_node
#git checkout tags/$BRANCHTAG_node

else

echo "${bold}REPO EXISTS, skip clone...${normal}"

fi

cd $GITREPOROOT_node

if git checkout $BRANCHTAG_node &&
    git fetch origin $BRANCHTAG_node &&
    [ `git rev-list HEAD...origin/$BRANCHTAG_node --count` != 0 ] &&
    git merge origin/$BRANCHTAG_node
then

cd $GITREPOROOT_node

sudo make uninstall
GITRESET_NODE
GITSBMDLINIT

./configure
make -j 4 
sudo make install

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

## node install end

## npm install start
echo "${bold}
 _   _ ____  __  __ 
| \ | |  _ \|  \/  |
|  \| | |_) | |\/| |
| |\  |  __/| |  | |
|_| \_|_|   |_|  |_|
          
UPDATE     
${normal}"

if [ ! -d $GITCONFDIR ]

then

mkdir -p $GITCLONEDIR_npm
cd $GITCLONEDIR_npm
git clone --branch $BRANCHTAG_npm $GITREPO_npm
#git checkout tags/$BRANCHTAG_node

else

echo "${bold}REPO EXISTS, skip clone...${normal}"

fi

cd $GITREPOROOT_npm

if git checkout $BRANCHTAG_npm &&
    git fetch origin $BRANCHTAG_npm &&
    [ `git rev-list HEAD...origin/$BRANCHTAG_npm --count` != 0 ] &&
    git merge origin/$BRANCHTAG_npm
then

cd $GITREPOROOT_npm

sudo make uninstall
GITRESET_NPM
GITSBMDLINIT

./configure 
make -j 4
sudo make install

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

# npm install end

# udpate system links
sudo updatedb
sudo ldconfig

