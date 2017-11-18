#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/secretsquirrel/BDFProxy.git
GITREPOROOT=/opt/ITSEC/7.Mitm/bdfproxy/secretsquirrel/BDFProxy
GITCLONEDIR=/opt/ITSEC/7.Mitm/bdfproxy/secretsquirrel
EXECUTEABLE1=bdf_proxy.py
EXECUTEABLE2=bdfproxy
EXECUTEABLE3=wpBDF.sh
EXECUTEABLE4=wpBDF
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=bdfproxy.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
 ____  ____  _____ ____  ____   _____  ____   __
| __ )|  _ \|  ___|  _ \|  _ \ / _ \ \/ /\ \ / /
|  _ \| | | | |_  | |_) | |_) | | | \  /  \ V / 
| |_) | |_| |  _| |  __/|  _ <| |_| /  \   | |  
|____/|____/|_|   |_|   |_| \_\\___/_/\_\  |_|  
       
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO

cd $GITREPOROOT

GITSBMDLINIT
sudo -H pip install configobj
sudo -H pip install pefile
######################################################
cd bdf
git clone https://github.com/aquynh/capstone
cd capstone
git checkout next
./make.sh
sudo ./make.sh install

cd bindings/python
sudo make install
#sudo echo "#capstone shared libs" >> /etc/ld.so.conf.d/capstone.conf
#sudo echo "/usr/lib64" >> /etc/ld.so.conf.d/capstone.conf

######################################################
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo rm -f $BINDIR/$EXECUTEABLE4
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE4
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL