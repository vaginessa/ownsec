#!/bin/bash
#NOT WORKING
#
bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/inquisb/keimpx.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/keimpx/inquisb/keimpx
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/keimpx/inquisb
EXECUTEABLE1=keimpx.sh
EXECUTEABLE2=keimpx
EXECUTEABLE3=keimpx.py
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network
DSKTPFL=keimpx.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _  _______ ___ __  __ ______  __
| |/ / ____|_ _|  \/  |  _ \ \/ /
| ' /|  _|  | || |\/| | |_) \  / 
| . \| |___ | || |  | |  __//  \ 
|_|\_\_____|___|_|  |_|_|  /_/\_\
              
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT
GITSBMDLINIT

sudo -H pip2 install -r requirements.txt
sudo updatedb
sudo ldconfig
#sudo -H pip3 install -r requirements.txt
#sudo python3 setup.py install

echo '#!/bin/bash
/opt/ITSEC/4.Password/1.Network/keimpx/inquisb/keimpx

python keimpx.py "$@"' > $EXECUTEABLE1

chmod +x $GITREPOROOT/$EXECUTEABLE3
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

mkdir -p $DSKTPFLSDEST
rm -f $DSKTPFLSDEST/$DSKTPFL
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
