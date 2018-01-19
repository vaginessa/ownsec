#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/netsniff-ng/netsniff-ng.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/netsniff-ng/netsniff-ng/netsniff-ng
GITCLONEDIR=/opt/ITSEC/7.Mitm/netsniff-ng/netsniff-ng
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/netsniff-ng
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/netsniff-ng
DSKTPFL=netsniff.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/netsniff-ng
#ph1a

echo "${bold}
 _   _ _____ _____ ____  _   _ ___ _____ _____     _   _  ____ 
| \ | | ____|_   _/ ___|| \ | |_ _|  ___|  ___|   | \ | |/ ___|
|  \| |  _|   | | \___ \|  \| || || |_  | |_ _____|  \| | |  _ 
| |\  | |___  | |  ___) | |\  || ||  _| |  _|_____| |\  | |_| |
|_| \_|_____| |_| |____/|_| \_|___|_|   |_|       |_| \_|\____|
        
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

make clean
GITSBMDLINIT

./configure 
make -j 4
sudo make install
#333d
CPDESKTFL