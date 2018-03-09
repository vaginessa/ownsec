#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/grwl/sslcaudit.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/4.SSL/sslcaudit/grwl/sslcaudit
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/4.SSL/sslcaudit/grwl
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/4.SSL/sslcaudit
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/4.SSL/sslcaudit
DSKTPFL=sslcaudit.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/4.SSL/sslcaudit
#ph1a

echo "${bold}
 ____ ____  _     ____    _   _   _ ____ ___ _____ 
/ ___/ ___|| |   / ___|  / \ | | | |  _ \_ _|_   _|
\___ \___ \| |  | |     / _ \| | | | | | | |  | |  
 ___) |__) | |__| |___ / ___ \ |_| | |_| | |  | |  
|____/____/|_____\____/_/   \_\___/|____/___| |_|  
             
INSTALL 
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
sudo updatedb
sudo ldconfig
### DEPS END

GITSBMDLINIT

sudo python setup.py install

#333d
CPDESKTFL

