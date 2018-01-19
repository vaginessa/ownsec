#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/HiroshiManRise/anonym8
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/anonym8/HiroshiManRise/anonym8
GITCONFDIR=/opt/ITSEC/8.Tunnel/anonym8/HiroshiManRise/anonym8/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/anonym8/HiroshiManRise
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/1.Pivot/anonym8
DSKTPFL=anonym8.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/1.Pivot/anonym8
#hd6cv

echo "${bold}
    _    _   _  ___  _   ___   ____  __  ___  
   / \  | \ | |/ _ \| \ | \ \ / /  \/  |( _ ) 
  / _ \ |  \| | | | |  \| |\ V /| |\/| |/ _ \ 
 / ___ \| |\  | |_| | |\  | | | | |  | | (_) |
/_/   \_\_| \_|\___/|_| \_| |_| |_|  |_|\___/ 
           
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
GITRESET
GITSBMDLINIT
chmod +x ./INSTALL.sh
#sudo ./INSTALL.sh

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

