#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/P0cL4bs/Thanos.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/thanos/P0cL4bs/Thanos
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/thanos/P0cL4bs
EXECUTEABLE1=thanos	
EXECUTEABLE2=thanos
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/thanos
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner/thanos
DSKTPFL=thanos.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/thanos
#ph1a

echo "${bold}
 _____ _   _    _    _   _  ___  ____  
|_   _| | | |  / \  | \ | |/ _ \/ ___| 
  | | | |_| | / _ \ |  \| | | | \___ \ 
  | | |  _  |/ ___ \| |\  | |_| |___) |
  |_| |_| |_/_/   \_\_| \_|\___/|____/ 
        
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add
### DEPS END

#make clean
GITSBMDLINIT
make -j 4
#sudo make install

CHMODXEX1

SYMLINKEX2TO1

#333d
CPDESKTFL

thanos --new-db banner_grabber.db
