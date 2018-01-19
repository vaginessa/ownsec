#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/SpiderLabs/Responder.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/responder/SpiderLabs/Responder
GITCLONEDIR=/opt/ITSEC/7.Mitm/responder/SpiderLabs
EXECUTEABLE1=Responder.py
EXECUTEABLE2=responder
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/responder
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/responder
DSKTPFL=responder.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/responder
#ph1a

echo "${bold}
 ____  _____ ____  ____   ___  _   _ ____  _____ ____  
|  _ \| ____/ ___||  _ \ / _ \| \ | |  _ \| ____|  _ \ 
| |_) |  _| \___ \| |_) | | | |  \| | | | |  _| | |_) |
|  _ <| |___ ___) |  __/| |_| | |\  | |_| | |___|  _ < 
|_| \_\_____|____/|_|    \___/|_| \_|____/|_____|_| \_\
           
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
#333d
CPDESKTFL

