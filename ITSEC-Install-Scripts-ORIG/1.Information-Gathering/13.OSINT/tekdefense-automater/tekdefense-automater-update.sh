#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/1aN0rmus/TekDefense-Automater.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/tekdefense-automater/1aN0rmus/TekDefense-Automater
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/tekdefense-automater/1aN0rmus/TekDefense-Automater/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/tekdefense-automater/1aN0rmus
EXECUTEABLE1=Automater.py
EXECUTEABLE2=automater
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/13.OSINT/tekdefense-automater
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT/tekdefense-automater
DSKTPFL=automater.desktop
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
    _   _   _ _____ ___  __  __    _  _____ _____ ____  
   / \ | | | |_   _/ _ \|  \/  |  / \|_   _| ____|  _ \ 
  / _ \| | | | | || | | | |\/| | / _ \ | | |  _| | |_) |
 / ___ \ |_| | | || |_| | |  | |/ ___ \| | | |___|  _ < 
/_/   \_\___/  |_| \___/|_|  |_/_/   \_\_| |_____|_| \_\
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
sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
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
