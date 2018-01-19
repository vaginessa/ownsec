#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/Hood3dRob1n/BinGoo.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/11.Dork/bingoo/Hood3dRob1n/BinGoo
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/11.Dork/bingoo/Hood3dRob1n
EXECUTEABLE1=bingoo
EXECUTEABLE2=bingoo.sh
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/11.Dork/bingoo
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/11.Dork/bingoo
DSKTPFL=bingoo.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/11.Dork/bingoo
#ph1a

echo "${bold}
 ____ ___ _   _  ____  ___   ___  
| __ )_ _| \ | |/ ___|/ _ \ / _ \ 
|  _ \| ||  \| | |  _| | | | | | |
| |_) | || |\  | |_| | |_| | |_| |
|____/___|_| \_|\____|\___/ \___/ 
    
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

echo '#!/bin/bash -i

cd /opt/ITSEC/1.Information-Gathering/11.Dork/bingoo/Hood3dRob1n/BinGoo

./bingoo "$@"' > $EXECUTEABLE2
CHMODXEX1
CHMODXEX2

sudo ln -s $GITREPOROOT/$EXECUTEABLE2 $BINDIR/$EXECUTEABLE1

#333d 
CPDESKTFL
