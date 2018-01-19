#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/robertswiecki/intrace.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/intrace/robertswiecki/intrace
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/intrace/robertswiecki
EXECUTEABLE1=intrace
EXECUTEABLE2=intrace
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/3.Route-Analysis/intrace
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/3.Route-Analysis/intrace
DSKTPFL=intrace.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
#ph1a

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

echo "${bold}
 ___ _   _ _____ ____      _    ____ _____ 
|_ _| \ | |_   _|  _ \    / \  / ___| ____|
 | ||  \| | | | | |_) |  / _ \| |   |  _|  
 | || |\  | | | |  _ <  / ___ \ |___| |___ 
|___|_| \_| |_| |_| \_\/_/   \_\____|_____|
               
INSTALL                                
${normal}"

#plh11
GITCLONEFUNC

make clean

GITSBMDLINIT
make -j 4
SYMLINKEX2TO1
#333d
CPDESKTFL
