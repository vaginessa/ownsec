#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/kamorin/DHCPig
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/dhcpig/kamorin/DHCPig
GITCLONEDIR=/opt/ITSEC/10.Stresstest/dhcpig/kamorin
EXECUTEABLE1=pig.py
EXECUTEABLE2=dhcPIG
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/dhcpig
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest/dhcpig
DSKTPFL=dhcpig.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/dhcpig
#ph1a

echo "${bold}
 ____  _   _  ____ ____ ___ ____ 
|  _ \| | | |/ ___|  _ \_ _/ ___|
| | | | |_| | |   | |_) | | |  _ 
| |_| |  _  | |___|  __/| | |_| |
|____/|_| |_|\____|_|  |___\____|
            
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT
CHMODXEX1
RMBDREX2
SYMLINKEX2TO1
#333d && CPDESKTFL