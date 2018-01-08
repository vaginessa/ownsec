#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/dxa4481/WPA2-HalfHandshake-Crack
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/wpa2-halfhandshake-crack/dxa4481/WPA2-HalfHandshake-Crack
GITCONFDIR=/opt/ITSEC/6.Wireless/1.Wifi/wpa2-halfhandshake-crack/dxa4481/WPA2-HalfHandshake-Crack/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/wpa2-halfhandshake-crack/dxa4481
EXECUTEABLE1=halfHandshake.sh
EXECUTEABLE2=halfHandshake
EXECUTEABLE3=halfHandshake.py
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=wpa2-halfhandshake-crack.desktop
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
 _   _ _     _____ _   _ _   _ ____  ____  _   _ _  _______ 
| | | | |   |  ___| | | | \ | |  _ \/ ___|| | | | |/ / ____|
| |_| | |   | |_  | |_| |  \| | | | \___ \| |_| | ' /|  _|  
|  _  | |___|  _| |  _  | |\  | |_| |___) |  _  | . \| |___ 
|_| |_|_____|_|   |_| |_|_| \_|____/|____/|_| |_|_|\_\_____|
               
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
sudo python setup.py install

echo '#!/bin/bash

cd /opt/ITSEC/6.Wireless/1.Wifi/wpa2-halfhandshake-crack/dxa4481/WPA2-HalfHandshake-Crack/

python halfHandshake.py "$@" ' > $EXECUTEABLE1

chmod +x  $GITREPOROOT/$EXECUTEABLE3
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

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

