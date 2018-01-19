#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/vecna/sniffjoke.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/sniffjoke/vecna/sniffjoke
GITCONFDIR=/opt/ITSEC/7.Mitm/sniffjoke/vecna/sniffjoke/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/sniffjoke/vecna
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=sniffjoke.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
#ph1a

echo "${bold}
 ____  _   _ ___ _____ _____   _  ___  _  _______ 
/ ___|| \ | |_ _|  ___|  ___| | |/ _ \| |/ / ____|
\___ \|  \| || || |_  | |_ _  | | | | | ' /|  _|  
 ___) | |\  || ||  _| |  _| |_| | |_| | . \| |___ 
|____/|_| \_|___|_|   |_|  \___/ \___/|_|\_\_____|
         
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
sudo make uninstall
sudo updatedb
sudo ldconfig
sudo rm -r build
GITRESET
GITSBMDLINIT
mkdir build
cd build
cmake ..
make -j 4
sudo make install
#333d
CPDESKTFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi


