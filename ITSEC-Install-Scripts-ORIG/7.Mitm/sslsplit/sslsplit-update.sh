#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/droe/sslsplit.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/sslsplit/droe/sslsplit
GITCONFDIR=/opt/ITSEC/7.Mitm/sslsplit/droe/sslsplit/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/sslsplit/droe
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/sslsplit
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/sslsplit
DSKTPFL=sslsplit.desktop

APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/sslsplit
#ph1a

echo "${bold}
 ____ ____  _     ____  ____  _     ___ _____ 
/ ___/ ___|| |   / ___||  _ \| |   |_ _|_   _|
\___ \___ \| |   \___ \| |_) | |    | |  | |  
 ___) |__) | |___ ___) |  __/| |___ | |  | |  
|____/____/|_____|____/|_|   |_____|___| |_|  
            
UPDATE 
${normal}"

### DEPS:
sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-sslsplit.txt") -r -- sudo apt-get install -y

### DEPS END

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
sudo make uninstall
sudo updatedb
sudo ldconfig
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


