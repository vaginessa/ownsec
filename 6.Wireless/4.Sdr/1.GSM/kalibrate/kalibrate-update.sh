#!/bin/bash

GITREPO=https://github.com/steve-m/kalibrate-rtl
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/4.Sdr/1.GSM/kalibrate-rtl/steve-m/kalibrate-rtl
GITCONFDIR=/opt/ITSEC/6.Wireless/4.Sdr/1.GSM/kalibrate-rtl/steve-m/kalibrate-rtl/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/4.Sdr/1.GSM/kalibrate-rtl/steve-m
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
 _  __    _    _     ___ ____  ____      _  _____ _____ 
| |/ /   / \  | |   |_ _| __ )|  _ \    / \|_   _| ____|
| ' /   / _ \ | |    | ||  _ \| |_) |  / _ \ | | |  _|  
| . \  / ___ \| |___ | || |_) |  _ <  / ___ \| | | |___ 
|_|\_\/_/   \_\_____|___|____/|_| \_\/_/   \_\_| |_____|
                                                                                  
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

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT
make clean
GITRESET
GITSBMDLINIT
./bootstrap
./configure
make -j 4
sudo make install

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi