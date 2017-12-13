#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/byt3bl33d3r/sslstrip2.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/4.SSL/sslstrip2/byt3bl33d3r/sslstrip2
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/4.SSL/sslstrip2/byt3bl33d3r/sslstrip2/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/4.SSL/sslstrip2/byt3bl33d3r
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/master
	git pull
}
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____ ____  _     ____ _____ ____  ___ ____ ____  
/ ___/ ___|| |   / ___|_   _|  _ \|_ _|  _ \___ \ 
\___ \___ \| |   \___ \ | | | |_) || || |_) |__) |
 ___) |__) | |___ ___) || | |  _ < | ||  __// __/ 
|____/____/|_____|____/ |_| |_| \_\___|_|  |_____|
                                                  
UPDATE
${normal}"

if [ ! -d $GITCONFDIR ]

then

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO

else

echo "${bold}REPO EXISTS, skip clone...${normal}"

fi

cd $GITREPOROOT

if git checkout master &&
    git fetch origin master &&
    [ `git rev-list HEAD...origin/master --count` != 0 ] &&
    git merge origin/master
then
    
cd $GITREPOROOT
GITRESET
GITSBMDLINIT
sudo python setup.py install

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi