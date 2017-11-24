#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/MisterBianco/BoopSuite
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/boopsuite/MisterBianco/BoopSuite
GITCONFDIR=/opt/ITSEC/6.Wireless/1.Wifi/boopsuite/MisterBianco/BoopSuite/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/boopsuite/MisterBianco
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=boopsniff_gui.desktop
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
 ____                   ____        _ _       
| __ )  ___   ___  _ __/ ___| _   _(_) |_ ___ 
|  _ \ / _ \ / _ \| '_ \___ \| | | | | __/ _ \
| |_) | (_) | (_) | |_) |__) | |_| | | ||  __/
|____/ \___/ \___/| .__/____/ \__,_|_|\__\___|
                  |_|        
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

sudo -H pip2 install -r requirements.txt
sudo udpatedb
sudo ldconfig

sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo python install.py

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



