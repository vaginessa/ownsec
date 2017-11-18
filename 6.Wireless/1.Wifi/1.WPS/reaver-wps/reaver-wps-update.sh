#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/t6x/reaver-wps-fork-t6x.git
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/reaver-wps-fork-t6x/t6x/reaver-wps-fork-t6x
GITCONFDIR=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/reaver-wps-fork-t6x/t6x/reaver-wps-fork-t6x/.git
REPOBUILDDIR=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/reaver-wps-fork-t6x/t6x/reaver-wps-fork-t6x/src
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/reaver-wps-fork-t6x/t6x
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi/1.WPS
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/1.WPS
DSKTPFL=reaver.desktop
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
 ____  _____    ___     _______ ____  
|  _ \| ____|  / \ \   / / ____|  _ \ 
| |_) |  _|   / _ \ \ / /|  _| | |_) |
|  _ <| |___ / ___ \ V / | |___|  _ < 
|_| \_\_____/_/   \_\_/  |_____|_| \_\
            
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
make clean

GITRESET
GITSBMDLINIT

cd $REPOBUILDDIR
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
