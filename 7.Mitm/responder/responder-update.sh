#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/SpiderLabs/Responder.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/responder/SpiderLabs/Responder
GITCONFDIR=/opt/ITSEC/7.Mitm/responder/SpiderLabs/Responder/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/responder/SpiderLabs
EXECUTEABLE1=Responder.py
EXECUTEABLE2=responder
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=responder.desktop
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
 ____  _____ ____  ____   ___  _   _ ____  _____ ____  
|  _ \| ____/ ___||  _ \ / _ \| \ | |  _ \| ____|  _ \ 
| |_) |  _| \___ \| |_) | | | |  \| | | | |  _| | |_) |
|  _ <| |___ ___) |  __/| |_| | |\  | |_| | |___|  _ < 
|_| \_\_____|____/|_|    \___/|_| \_|____/|_____|_| \_\
           
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



