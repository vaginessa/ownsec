#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/portcullislabs/enum4linux.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/6.SMB/enum4linux/portcullislabs/enum4linux
GITCONFDIR=opt/ITSEC/1.Information-Gathering/6.SMB/enum4linux/portcullislabs/enum4linux/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/6.SMB/enum4linux/portcullislabs
EXECUTEABLE1=enum4linux.pl 
EXECUTEABLE2=enum4linux
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/6.SMB
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/6.SMB
DSKTPFL=enum4linux.desktop
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
 _____ _   _ _   _ __  __ _  _   _     ___ _   _ _   ___  __
| ____| \ | | | | |  \/  | || | | |   |_ _| \ | | | | \ \/ /
|  _| |  \| | | | | |\/| | || |_| |    | ||  \| | | | |\  / 
| |___| |\  | |_| | |  | |__   _| |___ | || |\  | |_| |/  \ 
|_____|_| \_|\___/|_|  |_|  |_| |_____|___|_| \_|\___//_/\_\
   
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


