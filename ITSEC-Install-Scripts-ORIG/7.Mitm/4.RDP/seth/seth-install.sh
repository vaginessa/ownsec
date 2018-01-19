#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/SySS-Research/Seth
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/seth/SySS-Research/Seth
GITCLONEDIR=/opt/ITSEC/7.Mitm/seth/SySS-Research
EXECUTEABLE1=seth.sh
EXECUTEABLE2=seth
EXECUTEABLE3=seth.py
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/4.RDP/seth
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/4.RDP/seth
DSKTPFL=seth.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/4.RDP/seth
#ph1a
echo "${bold}
 ____  _____ _____ _   _ 
/ ___|| ____|_   _| | | |
\___ \|  _|   | | | |_| |
 ___) | |___  | | |  _  |
|____/|_____| |_| |_| |_|
                         
INSTALL /SySS-Research/Seth
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# python3 tcpdump arpspoof openssl
# arpspoof is part of dsniff

#ph4gh

### DEPS END

GITSBMDLINIT

echo '#!/bin/bash -i 

cd /opt/ITSEC/7.Mitm/seth/SySS-Research/Seth
python seth.py "$@"' > $GITREPOROOT/$EXECUTEABLE1

CHMODXEX1
CHMODXEX3

SYMLINKEX2TO1
#333d
CPDESKTFL
