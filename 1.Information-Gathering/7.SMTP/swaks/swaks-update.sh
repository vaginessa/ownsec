#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/roman-rybalko/swaks.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/7.SMTP/swaks/roman-rybalko/swaks
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/7.SMTP/swaks/roman-rybalko/swaks/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/7.SMTP/swaks/roman-rybalko
EXECUTEABLE1=swaks
EXECUTEABLE2=swaks
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/7.SMTP
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/7.SMTP
DSKTPFL=swaks.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ______        ___    _  ______  
/ ___\ \      / / \  | |/ / ___| 
\___ \\ \ /\ / / _ \ | ' /\___ \ 
 ___) |\ V  V / ___ \| . \ ___) |
|____/  \_/\_/_/   \_\_|\_\____/ 
            
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
