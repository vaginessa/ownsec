#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/JPaulMora/Pyrit.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/pyrit/JPaulMora/Pyrit
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/pyrit/JPaulMora
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/pyrit
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local/pyrit
DSKTPFL=pyrit.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/pyrit
#ph1a

echo "${bold}
 ______   ______  ___ _____ 
|  _ \ \ / /  _ \|_ _|_   _|
| |_) \ V /| |_) || |  | |  
|  __/ | | |  _ < | |  | |  
|_|    |_| |_| \_\___| |_|  
            
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

sudo python setup.py install

#333d
CPDESKTFL