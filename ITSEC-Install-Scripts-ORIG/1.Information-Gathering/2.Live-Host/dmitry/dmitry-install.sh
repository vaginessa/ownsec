#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/jaygreig86/dmitry.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/dmitry/jaygreig86/dmitry
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/dmitry/jaygreig86
EXECUTEABLE1=dmitry
EXECUTEABLE2=dmitry
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/dmitry
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/dmitry
DSKTPFL=dmitry.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/dmitry
#ph1a

echo "${bold}
 ____  __  __ ___ _____ ______   __
|  _ \|  \/  |_ _|_   _|  _ \ \ / /
| | | | |\/| || |  | | | |_) \ V / 
| |_| | |  | || |  | | |  _ < | |  
|____/|_|  |_|___| |_| |_| \_\|_|  
           
INSTALL 
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

make clean
GITSBMDLINIT

chmod +x configure
chmod +x bootstrap
./bootstrap
./configure
make -j 4

sudo rm $BINDIR/$EXECUTEABLE2
CHMODXEX1
SYMLINKEX2TO1
#333d
CPDESKTFL
