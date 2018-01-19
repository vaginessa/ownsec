#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/astroza/udptunnel.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/udptunnel/astroza/udptunnel
GITCLONEDIR=/opt/ITSEC/8.Tunnel/udptunnel/astroza
EXECUTEABLE1=client
EXECUTEABLE2=udptunnel
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/udptunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/udptunnel
DSKTPFL=udptunnel.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/udptunnel
#ph1a

echo "${bold}
 _   _ ____  ____ _____ _   _ _   _ _   _ _____ _     
| | | |  _ \|  _ \_   _| | | | \ | | \ | | ____| |    
| | | | | | | |_) || | | | | |  \| |  \| |  _| | |    
| |_| | |_| |  __/ | | | |_| | |\  | |\  | |___| |___ 
 \___/|____/|_|    |_|  \___/|_| \_|_| \_|_____|_____|
          
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

make clean
GITSBMDLINIT

make -j 4

RMBDREX2
chmod +x $EXECUTEABLE1
SYMLINKEX2TO1
#333d
CPDESKTFL