#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/BlackArch/0trace.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/0trace/BlackArch/0trace
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/0trace/BlackArch/0trace/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/0trace/BlackArch
EXECUTEABLE1=0trace.py
EXECUTEABLE2=0trace
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/3.Route-Analysis
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/3.Route-Analysis
DSKTPFL=0trace.desktop
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
  ___ _____ ____      _    ____ _____ 
 / _ \_   _|  _ \    / \  / ___| ____|
| | | || | | |_) |  / _ \| |   |  _|  
| |_| || | |  _ <  / ___ \ |___| |___ 
 \___/ |_| |_| \_\/_/   \_\____|_____|
             
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


sudo rm -f  /usr/local/bin/0trace

sudo -H pip2 install pydnet
sudo -H pip2 install dpkt

cd $GITREPOROOT
GITRESET
GITSBMDLINIT

chmod +x $EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
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

