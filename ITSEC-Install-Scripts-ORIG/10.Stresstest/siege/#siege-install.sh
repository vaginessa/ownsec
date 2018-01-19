#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/JoeDog/siege
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/siege/JoeDog/siege
GITCLONEDIR=/opt/ITSEC/10.Stresstest/siege/JoeDog
EXECUTEABLE1=siege
EXECUTEABLE2=siege
#ph1b
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
#ph1a
echo "${bold}
 ____ ___ _____ ____ _____ 
/ ___|_ _| ____/ ___| ____|
\___ \| ||  _|| |  _|  _|  
 ___) | || |__| |_| | |___ 
|____/___|_____\____|_____|
          
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
