#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/mteg/braa.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/8.SNMP/braa/mteg/braa
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/8.SNMP/braa/mteg/braa/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/8.SNMP/braa/mteg
EXECUTEABLE1=braa
EXECUTEABLE2=braa
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/8.SNMP
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/8.SNMP
DSKTPFL=braa.desktop
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


echo "${bold}
 ____  ____      _        _    
| __ )|  _ \    / \      / \   
|  _ \| |_) |  / _ \    / _ \  
| |_) |  _ <  / ___ \  / ___ \ 
|____/|_| \_\/_/   \_\/_/   \_\

INSTALL
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

make -j 4
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm $BINDIR/$EXECUTEABLE2
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