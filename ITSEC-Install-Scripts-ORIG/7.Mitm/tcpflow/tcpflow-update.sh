#!/bin/bash 

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/simsong/tcpflow.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/tcpflow/simsong/tcpflow
GITCONFDIR=/opt/ITSEC/7.Mitm/tcpflow/simsong/tcpflow/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/tcpflow/simsong
EXECUTEABLE1=tcpflow
EXECUTEABLE2=tcpflow
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/tcpflow
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/tcpflow
DSKTPFL=tcpflow.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/tcpflow
#ph1a

echo "${bold}
 _____ ____ ____  _____ _     _____        __
|_   _/ ___|  _ \|  ___| |   / _ \ \      / /
  | || |   | |_) | |_  | |  | | | \ \ /\ / / 
  | || |___|  __/|  _| | |__| |_| |\ V  V /  
  |_| \____|_|   |_|   |_____\___/  \_/\_/   
         
UPDATE
${normal}"

### DEPS:
sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-tcpflow.txt") -r -- sudo apt-get install -y

### DEPS END

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
sudo make uninstall
sudo rm /usr/local/bin/$EXECUTEABLE2
make clean
GITRESET
GITSBMDLINIT
./bootstrap.sh
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



