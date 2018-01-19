#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/P0cL4bs/Thanos.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/thanos/P0cL4bs/Thanos
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/thanos/P0cL4bs/Thanos/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/thanos/P0cL4bs
EXECUTEABLE1=thanos	
EXECUTEABLE2=thanos
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/thanos
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner/thanos
DSKTPFL=thanos.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/thanos
#ph1a
GITRESET

echo "${bold}
 _____ _   _    _    _   _  ___  ____  
|_   _| | | |  / \  | \ | |/ _ \/ ___| 
  | | | |_| | / _ \ |  \| | | | \___ \ 
  | | |  _  |/ ___ \| |\  | |_| |___) |
  |_| |_| |_/_/   \_\_| \_|\___/|____/ 
        
UPDATE CHECK
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
#make clean
GITRESET
GITSBMDLINIT
#
make -j 4
#sudo make install

CHMODXEX1

sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2

#333d

CPDESKTFL

thanos --new-db banner_grabber.db

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi