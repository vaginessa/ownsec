#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/BlackArch/0trace.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/0trace/BlackArch/0trace
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/0trace/BlackArch
EXECUTEABLE1=0trace.py
EXECUTEABLE2=0trace
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/3.Route-Analysis/0trace
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/3.Route-Analysis/0trace
DSKTPFL=0trace.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
#ph1a

### DEPS:
sudo -H pip2 install pydnet
sudo -H pip2 install dpkt
sudo updatedb
sudo ldconfig
### DEPS END

echo "${bold}
  ___ _____ ____      _    ____ _____ 
 / _ \_   _|  _ \    / \  / ___| ____|
| | | || | | |_) |  / _ \| |   |  _|  
| |_| || | |  _ <  / ___ \ |___| |___ 
 \___/ |_| |_| \_\/_/   \_\____|_____|
             
${normal}"

#plh11
GITCLONEFUNC

GITSBMDLINIT

chmod +x $EXECUTEABLE1
SYMLINKEX2TO1
#333d  
CPDESKTFL


