#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/shinnok/johnny.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/johnny/shinnok/johnny
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/johnny/shinnok
EXECUTEABLE1=johnny
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/johnny
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local/johnny
DSKTPFL=johnny.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/johnny
#ph1a

echo "${bold}
     _  ___  _   _ _   _ _   ___   __
    | |/ _ \| | | | \ | | \ | \ \ / /
 _  | | | | | |_| |  \| |  \| |\ V / 
| |_| | |_| |  _  | |\  | |\  | | |  
 \___/ \___/|_| |_|_| \_|_| \_| |_|  
       
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:

sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-johnny.txt") -r -- sudo apt-get install -y

### DEPS END

GITSBMDLINIT

export QT_SELECT=qt5
qmake
make -j$(nproc)


SYMLINKEX1TO1
#333d
CPDESKTFL
