#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/vanhauser-thc/thc-hydra.git
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/thc-hydra/vanhauser-thc/thc-hydra
GITCONFDIR=/opt/ITSEC/4.Password/1.Network/thc-hydra/vanhauser-thc/thc-hydra/.git
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/thc-hydra/vanhauser-thc
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/thc-hydra
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/thc-hydra
DSKTPFL1=hydra-gtk.desktop
DSKTPFL2=hydra.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/thc-hydra
#ph1a

echo "${bold}
 _____ _   _  ____      _   ___   ______  ____      _    
|_   _| | | |/ ___|    | | | \ \ / /  _ \|  _ \    / \   
  | | | |_| | |   _____| |_| |\ V /| | | | |_) |  / _ \  
  | | |  _  | |__|_____|  _  | | | | |_| |  _ <  / ___ \ 
  |_| |_| |_|\____|    |_| |_| |_| |____/|_| \_\/_/   \_\
              
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
mkdir -p $DSKTPFLSDEST
rm -f $DSKTPFLSDEST/$DSKTPFL1
rm -f $DSKTPFLSDEST/$DSKTPFL2
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2


echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi
