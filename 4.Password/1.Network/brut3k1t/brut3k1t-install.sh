#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/ex0dus-0x/brut3k1t.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/brut3k1t/ex0dus-0x/brut3k1t
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/brut3k1t/ex0dus-0x
EXECUTEABLE1=brut3k1t.sh
EXECUTEABLE2=brut3k1t
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network/
DSKTPFLSDEST=/home/$USER/.local/share/applications/applications/4.Password/1.Network
DSKTPFL=brut3k1t.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  ____  _   _ _____ _____ _  ___ _____ 
| __ )|  _ \| | | |_   _|___ /| |/ / |_   _|
|  _ \| |_) | | | | | |   |_ \| ' /| | | |  
| |_) |  _ <| |_| | | |  ___) | . \| | | |  
|____/|_| \_\\___/  |_| |____/|_|\_\_| |_|  
          
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
## Installed w apt lists - see /opt/ITSEC-Install-Scripts/0.Initial/lst/apt
# sudo apt-get update
# sudo apt-get upgrade
# xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-brut3k1t.txt") -r -- sudo apt-get install -y

sudo -H pip2 install asn1crypto
sudo updatedb
sudo ldconfig
sudo -H pip2 install -r requirements.txt
sudo updatedb
sudo ldconfig
### DEPS END

GITSBMDLINIT

echo '#!/bin/bash
cd /opt/ITSEC/4.Password/1.Network/brut3k1t/ex0dus-0x/brut3k1t
./brut3k1t "$@"' > $EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
