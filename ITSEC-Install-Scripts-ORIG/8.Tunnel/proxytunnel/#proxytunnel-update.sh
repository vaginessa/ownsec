#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/proxytunnel/proxytunnel
GITREPOROOT=/opt/ITSEC/8.Tunnel/proxytunnel/proxytunnel/proxytunnel
GITCONFDIR=/opt/ITSEC/8.Tunnel/proxytunnel/proxytunnel/proxytunnel/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/proxytunnel/proxytunnel
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/proxytunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/proxytunnel
DSKTPFL=proxytunnel.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/proxytunnel
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
 ____  ____   _____  ____   _______ _   _ _   _ _   _ _____ _     
|  _ \|  _ \ / _ \ \/ /\ \ / /_   _| | | | \ | | \ | | ____| |    
| |_) | |_) | | | \  /  \ V /  | | | | | |  \| |  \| |  _| | |    
|  __/|  _ <| |_| /  \   | |   | | | |_| | |\  | |\  | |___| |___ 
|_|   |_| \_\\___/_/\_\  |_|   |_|  \___/|_| \_|_| \_|_____|_____|
    
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
sudo make uninstall
make clean
GITRESET
GITSBMDLINIT

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

