#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/alexxy/netdiscover.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/netdiscover/alexxy/netdiscover
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/netdiscover/alexxy
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/netdiscover
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/netdiscover
DSKTPFL=netdiscover.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/netdiscover
#ph1a

echo "${bold}
 _   _ _____ _____ ____ ___ ____   ____ _____     _______ ____  
| \ | | ____|_   _|  _ \_ _/ ___| / ___/ _ \ \   / / ____|  _ \ 
|  \| |  _|   | | | | | | |\___ \| |  | | | \ \ / /|  _| | |_) |
| |\  | |___  | | | |_| | | ___) | |__| |_| |\ V / | |___|  _ < 
|_| \_|_____| |_| |____/___|____/ \____\___/  \_/  |_____|_| \_\
        
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

mkdir build
cd build
cmake ..
make -j 4
sudo make install

#333d
CPDESKTFL