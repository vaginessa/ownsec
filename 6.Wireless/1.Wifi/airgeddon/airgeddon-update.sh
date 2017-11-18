#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/v1s1t0r1sh3r3/airgeddon
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/airgeddon/v1s1t0r1sh3r3/airgeddon
GITCONFDIR=/opt/ITSEC/6.Wireless/1.Wifi/airgeddon/v1s1t0r1sh3r3/airgeddon/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/airgeddon/v1s1t0r1sh3r3
EXECUTEABLE1=airgeddon_run.sh
EXECUTEABLE2=airgeddon
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=airgeddon.desktop
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
    _    ___ ____   ____ _____ ____  ____   ___  _   _ 
   / \  |_ _|  _ \ / ___| ____|  _ \|  _ \ / _ \| \ | |
  / _ \  | || |_) | |  _|  _| | | | | | | | | | |  \| |
 / ___ \ | ||  _ <| |_| | |___| |_| | |_| | |_| | |\  |
/_/   \_\___|_| \_\\____|_____|____/|____/ \___/|_| \_|
             
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
GITRESET
GITSBMDLINIT

echo '#!/bin/bash 

cd /opt/ITSEC/6.Wireless/1.Wifi/airgeddon/v1s1t0r1sh3r3/airgeddon
sudo ./airgeddon.sh "$@"' > $EXECUTEABLE1

chmod +x $GITREPOROOT/$EXECUTEABLE1
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
