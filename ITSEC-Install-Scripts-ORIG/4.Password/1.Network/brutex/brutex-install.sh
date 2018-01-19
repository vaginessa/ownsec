#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/1N3/BruteX
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/brutex/1N3/BruteX
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/brutex/1N3
EXECUTEABLE1=brutex
EXECUTEABLE2=brutex
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/brutex
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/brutex
DSKTPFL=brutex.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/brutex
#ph1a

echo "${bold}
 ____  ____  _   _ _____ _______  __
| __ )|  _ \| | | |_   _| ____\ \/ /
|  _ \| |_) | | | | | | |  _|  \  / 
| |_) |  _ <| |_| | | | | |___ /  \ 
|____/|_| \_\\___/  |_| |_____/_/\_\
      
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

sed -i 's#/usr/share/brutex#/opt/ITSEC/4.Password/1.Network/brutex/1N3/BruteX#g' brutex

GITCLONEFUNC
mkdir loot

CHMODXEX1

SYMLINKEX2TO1

#333d

CPDESKTFL

