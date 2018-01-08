#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/DanMcInerney/wifijammer.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/3.Jammer/wifijammer/DanMcInerney/wifijammer
GITCONFDIR=/opt/ITSEC/6.Wireless/1.Wifi/3.Jammer/wifijammer/DanMcInerney/wifijammer/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/3.Jammer/wifijammer/DanMcInerney
EXECUTEABLE1=wifijammer.py
EXECUTEABLE2=wifijammer
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi/3.Jammer
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/3.Jammer
DSKTPFL=wifijammer.desktop
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
__        _____ _____ ___    _   _    __  __ __  __ _____ ____  
\ \      / /_ _|  ___|_ _|  | | / \  |  \/  |  \/  | ____|  _ \ 
 \ \ /\ / / | || |_   | |_  | |/ _ \ | |\/| | |\/| |  _| | |_) |
  \ V  V /  | ||  _|  | | |_| / ___ \| |  | | |  | | |___|  _ < 
   \_/\_/  |___|_|   |___\___/_/   \_\_|  |_|_|  |_|_____|_| \_\
            
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
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi
