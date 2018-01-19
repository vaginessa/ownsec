#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/frdmn/findmyhash.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/findmyhash/frdmn/findmyhash
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/findmyhash/frdmn
EXECUTEABLE1=findmyhash.sh
EXECUTEABLE2=findmyhash
EXECUTEABLE3=findmyhash.py
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/findmyhash
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/findmyhash
DSKTPFL=findmyhash.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/findmyhash
#ph1a

echo "${bold}
 _____ ___ _   _ ____  __  ____   ___   _    _    ____  _   _ 
|  ___|_ _| \ | |  _ \|  \/  \ \ / / | | |  / \  / ___|| | | |
| |_   | ||  \| | | | | |\/| |\ V /| |_| | / _ \ \___ \| |_| |
|  _|  | || |\  | |_| | |  | | | | |  _  |/ ___ \ ___) |  _  |
|_|   |___|_| \_|____/|_|  |_| |_| |_| |_/_/   \_\____/|_| |_|
           
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

echo '#!/bin/bash

cd /opt/ITSEC/4.Password/1.Network/findmyhash/frdmn/findmyhash

python findmyhash.py "$@"' > $EXECUTEABLE1
CHMODXEX1

SYMLINKEX2TO1

#333d
CPDESKTFL