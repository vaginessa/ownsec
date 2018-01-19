#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/jmk-foofus/medusa.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/medusa/jmk-foofus/medusa
GITCONFDIR=/opt/ITSEC/4.Password/1.Network/medusa/jmk-foofus/medusa/.git
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/medusa/jmk-foofus
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/medusa
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/medusa
DSKTPFL=medusa.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/medusa
#ph1a

echo "${bold}
 __  __ _____ ____  _   _ ____    _    
|  \/  | ____|  _ \| | | / ___|  / \   
| |\/| |  _| | | | | | | \___ \ / _ \  
| |  | | |___| |_| | |_| |___) / ___ \ 
|_|  |_|_____|____/ \___/|____/_/   \_\
              
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC

sudo rm -r $GITREPOROOT/deps
GITRESET
make clean
GITSBMDLINIT

mkdir deps
cd deps

cd afpfs-ng
sudo make uninstall 
make clean
GITRESET
GITSBMDLINIT
./configure
make -j 4 
sudo make install 
GITCLONEFUNC

./configure 
make -j 4
sudo make install
#

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

