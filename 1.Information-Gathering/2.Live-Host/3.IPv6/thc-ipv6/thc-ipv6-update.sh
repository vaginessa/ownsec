#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/vanhauser-thc/thc-ipv6.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/3.IPv6/thc-ipv6/vanhauser-thc/thc-ipv6
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/3.IPv6/thc-ipv6/vanhauser-thc/thc-ipv6/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/3.IPv6/thc-ipv6/vanhauser-thc
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host/3.IPv6
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/3.IPv6
DSKTPFL=thcping6.desktop
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
 _____ _   _  ____     ___ ______     ____   
|_   _| | | |/ ___|   |_ _|  _ \ \   / / /_  
  | | | |_| | |   _____| || |_) \ \ / / '_ \ 
  | | |  _  | |__|_____| ||  __/ \ V /| (_) |
  |_| |_| |_|\____|   |___|_|     \_/  \___/ 
       
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