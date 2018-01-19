#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/izderadicka/ptunnel.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/ptunnel/izderadicka/ptunnel
GITCONFDIR=/opt/ITSEC/8.Tunnel/ptunnel/izderadicka/ptunnel/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/ptunnel/izderadicka
BINDIRLCL=/opt/ITSEC/8.Tunnel/ptunnel/izderadicka/ptunnel/src
EXECUTEABLE1=ptunnel.py
EXECUTEABLE2=ptunnel
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/ptunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/ptunnel
DSKTPFL=ptunnel.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/ptunnel
#hd6cv

echo "${bold}
 ____ _____ _   _ _   _ _   _ _____ _     
|  _ \_   _| | | | \ | | \ | | ____| |    
| |_) || | | | | |  \| |  \| |  _| | |    
|  __/ | | | |_| | |\  | |\  | |___| |___ 
|_|    |_|  \___/|_| \_|_| \_|_____|_____|
           
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
cd $BINDIRLCL

chmod +x $EXECUTEABLE1 
sudo ln -s $BINDIRLCL/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

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

