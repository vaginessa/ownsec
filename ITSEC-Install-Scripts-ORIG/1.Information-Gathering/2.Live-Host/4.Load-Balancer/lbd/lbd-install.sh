#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=git://git.kali.org/packages/lbd.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/4.Load-Balancer/lbd/KALI/lbd
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/4.Load-Balancer/lbd/KALI
EXECUTEABLE1=lbd
EXECUTEABLE2=lbd
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/4.Load-Balancer/lbd
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/4.Load-Balancer/lbd
DSKTPFL=lbd.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/4.Load-Balancer/lbd
#ph1a

echo "${bold}
 _     ____  ____  
| |   | __ )|  _ \ 
| |   |  _ \| | | |
| |___| |_) | |_| |
|_____|____/|____/ 
               
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