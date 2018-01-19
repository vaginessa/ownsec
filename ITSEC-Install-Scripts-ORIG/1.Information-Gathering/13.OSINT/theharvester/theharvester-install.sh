#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/laramies/theHarvester.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/theharvester/laramies/theHarvester
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/theharvester/laramies
EXECUTEABLE1=theHarvester.py
EXECUTEABLE2=theharvester
EXECUTEABLE3=myparser.py
EXECUTEABLE4=myparser
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/13.OSINT/theharvester
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT/theharvester
DSKTPFL=theharvester.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/13.OSINT/theharvester
#ph1a

echo "${bold}
 _____ _   _ _____ _   _    _    ______     _______ ____ _____ _____ ____  
|_   _| | | | ____| | | |  / \  |  _ \ \   / / ____/ ___|_   _| ____|  _ \ 
  | | | |_| |  _| | |_| | / _ \ | |_) \ \ / /|  _| \___ \ | | |  _| | |_) |
  | | |  _  | |___|  _  |/ ___ \|  _ < \ V / | |___ ___) || | | |___|  _ < 
  |_| |_| |_|_____|_| |_/_/   \_\_| \_\ \_/  |_____|____/ |_| |_____|_| \_\
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

CHMODXEX1
SYMLINKEX2TO1
CHMODXEX3
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE4
#333d
CPDESKTFL