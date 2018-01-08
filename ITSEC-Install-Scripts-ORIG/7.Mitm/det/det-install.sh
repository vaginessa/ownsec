#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/sensepost/DET.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/det/sensepost/DET
GITCLONEDIR=/opt/ITSEC/7.Mitm/det/sensepost
EXECUTEABLE1=det.sh
EXECUTEABLE2=det
EXECUTEABLE3=det.py
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/cdpsnarf
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/cdpsnarf
DSKTPFL=det.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/cdpsnarf
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
 ____  _____ _____ 
|  _ \| ____|_   _|
| | | |  _|   | |  
| |_| | |___  | |  
|____/|_____| |_|  
          
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
sudo -H pip2 install -r requirements.txt 
sudo updatedb
sudo ldconfig

### DEPS END

GITSBMDLINIT

echo '#!/bin/bash -i 

cd /opt/ITSEC/7.Mitm/det/sensepost/DET
python det.py "$@"' > $GITREPOROOT/$EXECUTEABLE1

chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE3
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
