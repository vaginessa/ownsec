#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/nmap/ncrack.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/ncrack/nmap/ncrack
GITCONFDIR=/opt/ITSEC/4.Password/1.Network/ncrack/nmap/ncrack/.git
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/ncrack/nmap
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/ncrack
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/ncrack
DSKTPFL=ncrack.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/ncrack
#ph1a

echo "${bold}
 _   _  ____ ____      _    ____ _  __
| \ | |/ ___|  _ \    / \  / ___| |/ /
|  \| | |   | |_) |  / _ \| |   | ' / 
| |\  | |___|  _ <  / ___ \ |___| . \ 
|_| \_|\____|_| \_\/_/   \_\____|_|\_\
          
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
make clean
GITRESET
GITSBMDLINIT

./configure
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


