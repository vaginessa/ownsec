#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=git://git.kali.org/packages/lbd.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/4.Load-Balancer/lbd/KALI/lbd
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/4.Load-Balancer/lbd/KALI/lbd/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/4.Load-Balancer/lbd/KALI
EXECUTEABLE1=lbd
EXECUTEABLE2=lbd
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host/4.Load-Balancer
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/4.Load-Balancer
DSKTPFL=lbd.desktop
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
 _     ____  ____  
| |   | __ )|  _ \ 
| |   |  _ \| | | |
| |___| |_) | |_| |
|_____|____/|____/ 
              
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

sudo rm -f $BINDIR/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE1
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