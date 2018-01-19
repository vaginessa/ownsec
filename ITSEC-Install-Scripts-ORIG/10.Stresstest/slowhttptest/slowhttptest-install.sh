#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/shekyan/slowhttptest
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/slowhttptest/shekyan/slowhttptest
GITCLONEDIR=/opt/ITSEC/10.Stresstest/slowhttptest/shekyan
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/slowhttptest
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest/slowhttptest
DSKTPFL=slowhttptest.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/slowhttptest
#ph1a

echo "${bold}
 ____  _     _____        ___   _ _____ _____ ____ _____ _____ ____ _____ 
/ ___|| |   / _ \ \      / / | | |_   _|_   _|  _ \_   _| ____/ ___|_   _|
\___ \| |  | | | \ \ /\ / /| |_| | | |   | | | |_) || | |  _| \___ \ | |  
 ___) | |__| |_| |\ V  V / |  _  | | |   | | |  __/ | | | |___ ___) || |  
|____/|_____\___/  \_/\_/  |_| |_| |_|   |_| |_|    |_| |_____|____/ |_|  
            
INSTALL
${normal}"

#plh11
GITCLONEFUNC
sudo make uninstall

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT
./configure
make -j 4
sudo make install

#333d && CPDESKTFL