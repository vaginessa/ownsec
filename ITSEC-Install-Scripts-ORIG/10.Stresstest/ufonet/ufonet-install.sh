#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/epsylon/ufonet
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/ufonet/epsylon/ufonet
GITCLONEDIR=/opt/ITSEC/10.Stresstest/ufonet/epsylon
EXECUTEABLE1=ufonet.sh
EXECUTEABLE2=ufonet
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/ufonet
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest/ufonet
DSKTPFL=ufonet.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/ufonet
#ph1a

echo "${bold}
 _   _ _____ ___  _   _ _____ _____ 
| | | |  ___/ _ \| \ | | ____|_   _|
| | | | |_ | | | |  \| |  _|   | |  
| |_| |  _|| |_| | |\  | |___  | |  
 \___/|_|   \___/|_| \_|_____| |_|  
           
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT
#sudo python setup.py install

echo '#!/bin/bash
cd /opt/ITSEC/10.Stresstest/ufonet/epsylon/ufonet
./ufonet "$@"' > $EXECUTEABLE1
CHMODXEX1
CHMODXEX2
SYMLINKEX2TO1
#333d 
CPDESKTFL
