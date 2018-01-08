#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/secretsquirrel/BDFProxy.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/bdfproxy/secretsquirrel/BDFProxy
GITCONFDIR=/opt/ITSEC/7.Mitm/bdfproxy/secretsquirrel/BDFProxy/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/bdfproxy/secretsquirrel
EXECUTEABLE1=bdf_proxy.py
EXECUTEABLE2=bdfproxy
EXECUTEABLE3=wpBDF.sh
EXECUTEABLE4=wpBDF
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/bdfproxy
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/bdfproxy
DSKTPFL=bdfproxy.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/bdfproxy
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
       
UPDATE
${normal}"

if [ ! -d $GITCONFDIR ]

then

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

else

echo "${bold}REPO EXISTS, skip clone...${normal}"

fi

cd $GITREPOROOT

if git checkout $BRANCH &&
    git fetch origin $BRANCH &&
    [ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
    git merge origin/$BRANCH
then
    
cd $GITREPOROOT
GITRESET
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
rm -f $DSKTPFLSDEST/$DSKTPFL
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

