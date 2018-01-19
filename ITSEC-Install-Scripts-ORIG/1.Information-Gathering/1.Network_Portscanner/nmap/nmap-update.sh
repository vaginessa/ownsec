#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/nmap/nmap.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/nmap/nmap/nmap
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/nmap/nmap/nmap/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/nmap/nmap
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/nmap
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner/nmap
DSKTPFL=nmap.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/nmap
#ph1a
GITRESET

echo "${bold}
 _   _ __  __    _    ____  
| \ | |  \/  |  / \  |  _ \ 
|  \| | |\/| | / _ \ | |_) |
| |\  | |  | |/ ___ \|  __/ 
|_| \_|_|  |_/_/   \_\_|    
            
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
 
CPDESKTFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

