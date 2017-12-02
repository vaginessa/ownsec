#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/simsong/bulk_extractor
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Forensics/0.Toolbox/bulk_extractor/simsong/bulk_extractor
GITCONFDIR=/opt/ITSEC/8.Forensics/0.Toolbox/bulk_extractor/simsong/.git
GITCLONEDIR=/opt/ITSEC/8.Forensics/0.Toolbox/bulk_extractor/simsong
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications
DSKTPFLSDEST=/home/$USER/.local/share/applications
DSKTPFL=bulk-extractor.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  _     _  _________  _______ ____   ____ _____ ____  
| __ )| |   | |/ / ____\ \/ /_   _|  _ \ / ___|_   _|  _ \ 
|  _ \| |   | ' /|  _|  \  /  | | | |_) | |     | | | |_) |
| |_) | |___| . \| |___ /  \  | | |  _ <| |___  | | |  _ < 
|____/|_____|_|\_\_____/_/\_\ |_| |_| \_\\____| |_| |_| \_\
      
INSTALL
${normal}"

cd $GITREPOROOT

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
mkdir -p $DSKTPFLSDEST && cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL