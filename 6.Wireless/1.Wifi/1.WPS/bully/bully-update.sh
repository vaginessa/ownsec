#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/bully/aanarchyy
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/bully/aanarchyy/bully
GITCONFDIR=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/bully/aanarchyy/bully/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/bully/aanarchyy
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi/1.WPS
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/1.WPS
DSKTPFL=bully.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/master
	git pull
}
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  _   _ _     _  __   __
| __ )| | | | |   | | \ \ / /
|  _ \| | | | |   | |  \ V / 
| |_) | |_| | |___| |___| |  
|____/ \___/|_____|_____|_|  
       
UPDATE
${normal}"

if [ ! -d $GITCONFDIR ]

then

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO

else

echo "${bold}REPO EXISTS, skip clone...${normal}"

fi

cd $GITREPOROOT

if git checkout master &&
    git fetch origin master &&
    [ `git rev-list HEAD...origin/master --count` != 0 ] &&
    git merge origin/master
then
    
cd $GITREPOROOT

sudo make uninstall
sudo make clean
GITRESET
GITSBMDLINIT

cd src
./configure
make -j 4
sudo make install
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


