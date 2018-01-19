#!/bin/bash
#doesent work

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/rafael-santiago/pig
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/pig/rafael-santiago/pig
GITCLONEDIR=/opt/ITSEC/10.Stresstest/pig/rafael-santiago
#EXECUTEABLE1=pig.py
#EXECUTEABLE2=dhcpPIG
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
#ph1a

echo "${bold}
 ____ ___ ____ 
|  _ \_ _/ ___|
| |_) | | |  _ 
|  __/| | |_| |
|_|  |___\____|
              
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

git clone https://github.com/rafael-santiago/hefesto

cd hefesto
GITSBMDLINIT
cd /opt/ITSEC/10.Stresstest/pig/rafael-santiago/pig/hefesto/src/

./build.sh
#CHMODXEX1
#sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
