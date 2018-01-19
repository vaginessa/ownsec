#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/schweikert/fping.git
BRANCH=develop
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/fping/schweikert/fping
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/fping/schweikert
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/fping
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/fping
DSKTPFL=fping.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/fping
#ph1a

echo "${bold}
 _____ ____ ___ _   _  ____ 
|  ___|  _ \_ _| \ | |/ ___|
| |_  | |_) | ||  \| | |  _ 
|  _| |  __/| || |\  | |_| |
|_|   |_|  |___|_| \_|\____|
         
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

make clean
GITSBMDLINIT

./autogen.sh
./configure
make -j 4
sudo make install
#333d
CPDESKTFL
