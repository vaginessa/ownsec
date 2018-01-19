#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://bitbucket.org/LaNMaSteR53/recon-ng.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/recon-ng/LaNMaSteR53/recon-ng
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/recon-ng/LaNMaSteR53/recon-ng/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/recon-ng/LaNMaSteR53
EXECUTEABLE1=recon-ng
EXECUTEABLE2=recon-ng
EXECUTEABLE3=recon-cli
EXECUTEABLE4=recon-cli
EXECUTEABLE5=recon-rpc
EXECUTEABLE6=recon-rpc
EXECUTEABLE7=recon-web
EXECUTEABLE8=recon-web
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=recon-ng.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/recon-ng
#hd6cv


echo "${bold}
 ____  _____ ____ ___  _   _       _   _  ____ 
|  _ \| ____/ ___/ _ \| \ | |     | \ | |/ ___|
| |_) |  _|| |  | | | |  \| |_____|  \| | |  _ 
|  _ <| |__| |__| |_| | |\  |_____| |\  | |_| |
|_| \_\_____\____\___/|_| \_|     |_| \_|\____|
            
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC



sudo rm -f $BINDIR/$EXECUTEABLE4
sudo rm -f $BINDIR/$EXECUTEABLE6
sudo rm -f $BINDIR/$EXECUTEABLE8

GITCLONEFUNC
GITRESET
GITSBMDLINIT

CHMODXEX1
SYMLINKEX2TO1

CHMODXEX3
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE4

chmod +x $GITREPOROOT/$EXECUTEABLE5
sudo ln -s $GITREPOROOT/$EXECUTEABLE5 $BINDIR/$EXECUTEABLE6

chmod +x $GITREPOROOT/$EXECUTEABLE7
sudo ln -s $GITREPOROOT/$EXECUTEABLE7 $BINDIR/$EXECUTEABLE8
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
