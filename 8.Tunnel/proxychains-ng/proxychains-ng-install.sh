#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/rofl0r/proxychains-ng
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/proxychains-ng/rofl0r/proxychains-ng
GITCLONEDIR=/opt/ITSEC/8.Tunnel/proxychains-ng/rofl0r
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=proxychains-ng.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  ____   _____  ____   ______ _   _    _    ___ _   _ ____  _  _   
|  _ \|  _ \ / _ \ \/ /\ \ / / ___| | | |  / \  |_ _| \ | / ___|| || |  
| |_) | |_) | | | \  /  \ V / |   | |_| | / _ \  | ||  \| \___ \| || |_ 
|  __/|  _ <| |_| /  \   | || |___|  _  |/ ___ \ | || |\  |___) |__   _|
|_|   |_| \_\\___/_/\_\  |_| \____|_| |_/_/   \_\___|_| \_|____/   |_|  
        
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

./configure --prefix=/usr --sysconfdir=/etc
make -j 4
sudo make install 
sudo make install-config
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
