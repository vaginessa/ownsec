#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/proxytunnel/proxytunnel
GITREPOROOT=/opt/ITSEC/8.Tunnel/proxytunnel/proxytunnel/proxytunnel
GITCONFDIR=/opt/ITSEC/8.Tunnel/proxytunnel/proxytunnel/proxytunnel/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/proxytunnel/proxytunnel
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/proxytunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/proxytunnel
DSKTPFL=proxytunnel.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/proxytunnel
#hd6cv

echo "${bold}
 ____  ____   _____  ____   _______ _   _ _   _ _   _ _____ _     
|  _ \|  _ \ / _ \ \/ /\ \ / /_   _| | | | \ | | \ | | ____| |    
| |_) | |_) | | | \  /  \ V /  | | | | | |  \| |  \| |  _| | |    
|  __/|  _ <| |_| /  \   | |   | | | |_| | |\  | |\  | |___| |___ 
|_|   |_| \_\\___/_/\_\  |_|   |_|  \___/|_| \_|_| \_|_____|_____|
    
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

