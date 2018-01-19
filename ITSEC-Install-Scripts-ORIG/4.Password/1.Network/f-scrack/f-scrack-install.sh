#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/zgwdg/F-Scrack.git
BRANCH=master
#GITREPOROOT=/opt/ITSEC/4.Password/1.Network/f-scrack/ysrc/F-Scrack
#GITREPOROOT=/opt/ITSEC/4.Password/1.Network/f-scrack/y1ng1996/F-Scrack
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/f-scrack/zgwdg/F-Scrack
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/f-scrack/zgwdg
EXECUTEABLE1=F-Scrack.sh
EXECUTEABLE2=fscrack
EXECUTEABLE3=F-Scrack.py
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/f-scrack
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/f-scrack
DSKTPFL=f-scrack.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/f-scrack
#ph1a

echo "${bold}
 _____    ____   ____ ____      _    ____ _  __
|  ___|  / ___| / ___|  _ \    / \  / ___| |/ /
| |_ ____\___ \| |   | |_) |  / _ \| |   | ' / 
|  _|_____|__) | |___|  _ <  / ___ \ |___| . \ 
|_|      |____/ \____|_| \_\/_/   \_\____|_|\_\
            
INSTALL 
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

echo '#!/bin/bash

#cd /opt/ITSEC/4.Password/1.Network/f-scrack/ysrc/F-Scrack
#cd /opt/ITSEC/4.Password/1.Network/f-scrack/y1ng1996/F-Scrack
cd /opt/ITSEC/4.Password/1.Network/f-scrack/zgwdg/F-Scrack

python F-Scrack.py "$@"' > $EXECUTEABLE1
CHMODXEX1
CHMODXEX3

SYMLINKEX2TO1

#333d

CPDESKTFL
