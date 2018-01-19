#!/bin/bash

# Git functions
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

# Bindir
BINDIR=/usr/local/bin

# Script Styling - font
bold=$(tput bold)
normal=$(tput sgr0)

GITCLONEFUNC () {
mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT
}

CPDESKTFL  () {
mkdir -p $DSKTPFLSDEST
rm -f $DSKTPFLSDEST/$DSKTPFL
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
}

CHMODXEX1  () {
chmod +x $GITREPOROOT/$EXECUTEABLE1
}
CHMODXEX2  () {
chmod +x $GITREPOROOT/$EXECUTEABLE2
}
CHMODXEX3  () {
chmod +x $GITREPOROOT/$EXECUTEABLE3
}

SYMLINKEX2TO1  () {
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
}

SYMLINKEX1TO1  () {
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE1
}

RMBDREX1  () {
sudo rm -f $BINDIR/$EXECUTEABLE1
}

RMBDREX1  () {
sudo rm -f $BINDIR/$EXECUTEABLE2
}

PIP2INSTREQ () {
sudo -H pip2 install -r requirements.txt 
sudo updatedb
sudo ldconfig
}
PIP3INSTREQ () {
sudo -H pip3 install -r requirements.txt 
sudo updatedb
sudo ldconfig
}
PIPINSTREQ () {
sudo -H pip install -r requirements.txt 
sudo updatedb
sudo ldconfig
}


### updatefiles only


GITUPTODATE  () {
if [ ! -d $GITCONFDIR ]

then

GITCLONEFUNC

else

echo "${bold}REPO EXISTS, skip clone...${normal}"

fi


}




