#!/bin/bash

GITREPO=https://github.com/ptrkrysik/gr-gsm
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/4.Sdr/1.GSM/gr-gsm/ptrkrysik/gr-gsm
GITCONFDIR=/opt/ITSEC/6.Wireless/4.Sdr/1.GSM/gr-gsm/ptrkrysik/gr-gsm/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/4.Sdr/1.GSM/gr-gsm/ptrkrysik
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/4.Sdr/1.GSM
DSKTPFLSDEST=/home/$USER/.local/share/applications/3.Exploitation-Tools/6.Wireless/4.Sdr/1.GSM
DSKTPFL=gr-gsm.desktop
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
 ____ ____        ____ ____  __  __ 
 / ___|  _ \      / ___/ ___||  \/  |
| |  _| |_) |____| |  _\___ \| |\/| |
| |_| |  _ <_____| |_| |___) | |  | |
 \____|_| \_\     \____|____/|_|  |_|
                                     
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

sudo rm -r build
GITRESET
GITSBMDLINIT

sudo -H pip install PyBOMBS
sudo updatedb
sudo ldconfig
#configure installation prefix:
sudo pybombs prefix init /usr/local -a default_prx
sudo pybombs config default_prefix default_prx
#download recipes:
sudo pybombs recipes add gr-recipes git+https://github.com/gnuradio/gr-recipes.git
sudo pybombs recipes add gr-etcetera git+https://github.com/gnuradio/gr-etcetera.git

#sudo pybombs install gr-gsm

mkdir build
cd build
cmake ..
make -j 4
sudo make install

mkdir -p $DSKTPFLSDEST
rm -f $DSKTPFLSDEST/$DSKTPFL
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi