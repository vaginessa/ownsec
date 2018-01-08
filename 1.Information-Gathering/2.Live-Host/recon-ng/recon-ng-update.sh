#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://bitbucket.org/LaNMaSteR53/recon-ng.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/recon-ng/LaNMaSteR53/recon-ng
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/recon-ng/LaNMaSteR53/recon-ng/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/recon-ng/LaNMaSteR53
EXECUTEABLE1=recon-ng
EXECUTEABLE2=recon-ng
EXECUTEABLE3=recon-cli
EXECUTEABLE4=recon-cli
EXECUTEABLE5=recon-rpc
EXECUTEABLE6=recon-rpc
EXECUTEABLE7=recon-web
EXECUTEABLE8=recon-web
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=recon-ng.desktop
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
 ____  _____ ____ ___  _   _       _   _  ____ 
|  _ \| ____/ ___/ _ \| \ | |     | \ | |/ ___|
| |_) |  _|| |  | | | |  \| |_____|  \| | |  _ 
|  _ <| |__| |__| |_| | |\  |_____| |\  | |_| |
|_| \_\_____\____\___/|_| \_|     |_| \_|\____|
            
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


sudo rm -f $BINDIR/$EXECUTEABLE2
sudo rm -f $BINDIR/$EXECUTEABLE4
sudo rm -f $BINDIR/$EXECUTEABLE6
sudo rm -f $BINDIR/$EXECUTEABLE8

cd $GITREPOROOT
GITRESET
GITSBMDLINIT

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

chmod +x $GITREPOROOT/$EXECUTEABLE3
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE4

chmod +x $GITREPOROOT/$EXECUTEABLE5
sudo ln -s $GITREPOROOT/$EXECUTEABLE5 $BINDIR/$EXECUTEABLE6

chmod +x $GITREPOROOT/$EXECUTEABLE7
sudo ln -s $GITREPOROOT/$EXECUTEABLE7 $BINDIR/$EXECUTEABLE8
#
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
