#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/roobixx/cowpatty.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/1.WEP_WPA/cowpatty/roobixx/cowpatty
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/1.WEP_WPA/cowpatty/roobixx
EXECUTEABLE1=cowpatty
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/1.WEP_WPA/cowpatty
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local/1.WEP_WPA/cowpatty
DSKTPFL=cowpatty.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/1.WEP_WPA/cowpatty
#ph1a

echo "${bold}
  ____ _____        ______   _  _____ _______   __
 / ___/ _ \ \      / /  _ \ / \|_   _|_   _\ \ / /
| |  | | | \ \ /\ / /| |_) / _ \ | |   | |  \ V / 
| |__| |_| |\ V  V / |  __/ ___ \| |   | |   | |  
 \____\___/  \_/\_/  |_| /_/   \_\_|   |_|   |_|  
         
INSTALL
${normal}"

#plh11

GITCLONEFUNC

### DEPS:

sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-cowpatty.txt") -r -- sudo apt-get install -y

### DEPS END

make clean
GITSBMDLINIT

make -j 4
sudo chmod +x $EXECUTEABLE1
SYMLINKEX1TO1

#333d
CPDESKTFL