#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/frdmn/findmyhash.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/findmyhash/frdmn/findmyhash
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/findmyhash/frdmn
EXECUTEABLE1=findmyhash.sh
EXECUTEABLE2=findmyhash
EXECUTEABLE3=findmyhash.py
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network/
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network
DSKTPFL=findmyhash.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _____ ___ _   _ ____  __  ____   ___   _    _    ____  _   _ 
|  ___|_ _| \ | |  _ \|  \/  \ \ / / | | |  / \  / ___|| | | |
| |_   | ||  \| | | | | |\/| |\ V /| |_| | / _ \ \___ \| |_| |
|  _|  | || |\  | |_| | |  | | | | |  _  |/ ___ \ ___) |  _  |
|_|   |___|_| \_|____/|_|  |_| |_| |_| |_/_/   \_\____/|_| |_|
           
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

echo '#!/bin/bash

cd /opt/ITSEC/4.Password/1.Network/findmyhash/frdmn/findmyhash

python findmyhash.py "$@"' > $EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL