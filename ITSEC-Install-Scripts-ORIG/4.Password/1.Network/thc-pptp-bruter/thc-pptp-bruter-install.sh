#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/BlackArch/thc-pptp-bruter.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/thc-pptp-bruter/BlackArch/thc-pptp-bruter
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/thc-pptp-bruter/BlackArch
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/thc-pptp-bruter
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/thc-pptp-bruter
DSKTPFL=thc-pptp-bruter.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/thc-pptp-bruter
#ph1a

echo "${bold}
 _____ _   _  ____      ____  ____ _____ ____  
|_   _| | | |/ ___|    |  _ \|  _ \_   _|  _ \ 
  | | | |_| | |   _____| |_) | |_) || | | |_) |
  | | |  _  | |__|_____|  __/|  __/ | | |  __/ 
  |_| |_| |_|\____|    |_|   |_|    |_| |_|    
                                               
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:

sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-thc-pptp-bruter.txt") -r -- sudo apt-get install -y

### DEPS END

make clean
GITSBMDLINIT

./bootstrap
./configure
make -j 4
sudo make install
#333d
CPDESKTFL