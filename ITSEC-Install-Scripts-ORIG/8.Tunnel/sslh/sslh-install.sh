#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/yrutschle/sslh.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/sslh/yrutschle/sslh
GITCLONEDIR=/opt/ITSEC/8.Tunnel/sslh/yrutschle
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnell/sslh
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnell/sslh
DSKTPFL=pwnat.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnell/sslh
#ph1a

echo "${bold}
 ____ ____  _     _   _ 
/ ___/ ___|| |   | | | |
\___ \___ \| |   | |_| |
 ___) |__) | |___|  _  |
|____/____/|_____|_| |_|
            
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:

sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-sslh.txt") -r -- sudo apt-get install -y

sudo -H pip2 install virtualenvwrapper
sudo ldconfig
sudo updatedb
 
sudo -H pip2 install -r requirements.txt
sudo ldconfig
sudo updatedb
### DEPS END
make clean
GITSBMDLINIT

make -j 4
sudo make install
#333d
CPDESKTFL

