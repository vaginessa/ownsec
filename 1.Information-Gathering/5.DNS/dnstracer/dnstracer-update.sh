#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/pcoder/DNSTracer.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/5.DNS/dnstracer/pcoder/DNSTracer
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/5.DNS/dnstracer/pcoder/DNSTracer/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/5.DNS/dnstracer/pcoder
EXECUTEABLE1=mypydig.py
EXECUTEABLE2=dnstracer
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFL=dnstracer.desktop
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
 ____  _   _ ____ _____ ____      _    ____ _____ ____  
|  _ \| \ | / ___|_   _|  _ \    / \  / ___| ____|  _ \ 
| | | |  \| \___ \ | | | |_) |  / _ \| |   |  _| | |_) |
| |_| | |\  |___) || | |  _ <  / ___ \ |___| |___|  _ < 
|____/|_| \_|____/ |_| |_| \_\/_/   \_\____|_____|_| \_\
            
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
