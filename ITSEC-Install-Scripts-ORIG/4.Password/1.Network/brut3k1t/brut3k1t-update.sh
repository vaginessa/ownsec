#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/ex0dus-0x/brut3k1t.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/brut3k1t/ex0dus-0x/brut3k1t
GITCONFDIR=/opt/ITSEC/4.Password/1.Network/brut3k1t/ex0dus-0x/brut3k1t/.git
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/brut3k1t/ex0dus-0x
EXECUTEABLE1=brut3k1t.sh
EXECUTEABLE2=brut3k1t
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/brut3k1t
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/brut3k1t
DSKTPFL=brut3k1t.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
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

sudo -H pip2 install asn1crypto
sudo updatedb
sudo ldconfig
sudo -H pip2 install -r requirements.txt
sudo updatedb
sudo ldconfig

echo '#!/bin/bash
cd /opt/ITSEC/4.Password/1.Network/brut3k1t/ex0dus-0x/brut3k1t
./brut3k1t "$@"' > $EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

