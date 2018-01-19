#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/simsong/bulk_extractor
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Forensics/0.Toolbox/bulk_extractor/simsong/bulk_extractor
GITCONFDIR=/opt/ITSEC/8.Forensics/0.Toolbox/bulk_extractor/simsong/.git
GITCLONEDIR=/opt/ITSEC/8.Forensics/0.Toolbox/bulk_extractor/simsong
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG
DSKTPFLSDEST=/home/$USER/.local/share/applications
DSKTPFL=bulk-extractor.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
#ph1a

echo "${bold}
 ____  _     _  _________  _______ ____   ____ _____ ____  
| __ )| |   | |/ / ____\ \/ /_   _|  _ \ / ___|_   _|  _ \ 
|  _ \| |   | ' /|  _|  \  /  | | | |_) | |     | | | |_) |
| |_) | |___| . \| |___ /  \  | | |  _ <| |___  | | |  _ < 
|____/|_____|_|\_\_____/_/\_\ |_| |_| \_\\____| |_| |_| \_\
      
INSTALL
${normal}"

GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

make clean
GITSBMDLINIT
chmod +x bootstrap.sh
./bootstrap.sh
./configure
make -j 4
sudo make install
#333d && CPDESKTFL