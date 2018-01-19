#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/robertdavidgraham/masscan.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/masscan/robertdavidgraham/masscan
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/masscan/robertdavidgraham/masscan/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/masscan/robertdavidgraham
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/masscan
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner/masscan
DSKTPFL=masscan.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/masscan
#ph1a
GITRESET

echo "${bold}
 __  __    _    ____ ____   ____    _    _   _ 
|  \/  |  / \  / ___/ ___| / ___|  / \  | \ | |
| |\/| | / _ \ \___ \___ \| |     / _ \ |  \| |
| |  | |/ ___ \ ___) |__) | |___ / ___ \| |\  |
|_|  |_/_/   \_\____/____/ \____/_/   \_\_| \_|
        
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then

### DEPS:
sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-masscan.txt") -r -- sudo apt-get install -y
sudo updatedb
sudo ldconfig
### DEPS END

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


