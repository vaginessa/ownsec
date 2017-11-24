#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/risent/dns2tcp.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/dns2tcp/risent/dns2tcp
GITCONFDIR=/opt/ITSEC/8.Tunnel/dns2tcp/risent/dns2tcp/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/dns2tcp/risent
EXECUTEABLE1=dns2tcp
EXECUTEABLE2=dns2tcp
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=dns2tcp.desktop
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
 ____  _   _ ____ ____ _____ ____ ____  
|  _ \| \ | / ___|___ \_   _/ ___|  _ \ 
| | | |  \| \___ \ __) || || |   | |_) |
| |_| | |\  |___) / __/ | || |___|  __/ 
|____/|_| \_|____/_____||_| \____|_|    
              
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
go build

chmod +x $EXECUTEABLE1
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
