#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/nabla-c0d3/sslyze.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/4.SSL/sslyze/nabla-c0d3/sslyze
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/4.SSL/sslyze/nabla-c0d3
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/4.SSL/sslyze
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/4.SSL/sslyze
DSKTPFL=sslyze.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
#ph1a

echo "${bold}
 ____ ____  _  __   ____________ 
/ ___/ ___|| | \ \ / /__  / ____|
\___ \___ \| |  \ V /  / /|  _|  
 ___) |__) | |___| |  / /_| |___ 
|____/____/|_____|_| /____|_____|
           
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
sudo -H pip install -r requirements.txt
sudo updatedb
sudo ldconfig
### DEPS END

GITSBMDLINIT

sudo python3 setup.py install
#333d
CPDESKTFL
