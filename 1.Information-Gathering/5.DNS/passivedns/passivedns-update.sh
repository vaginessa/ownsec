#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/gamelinux/passivedns.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/5.DNS/passivedns/gamelinux/passivedns
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/5.DNS/passivedns/gamelinux/passivedns/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/5.DNS/passivedns/gamelinux
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFL=passivedns.desktop
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
 ____   _    ____ ____ _____     _______ ____  _   _ ____  
|  _ \ / \  / ___/ ___|_ _\ \   / / ____|  _ \| \ | / ___| 
| |_) / _ \ \___ \___ \| | \ \ / /|  _| | | | |  \| \___ \ 
|  __/ ___ \ ___) |__) | |  \ V / | |___| |_| | |\  |___) |
|_| /_/   \_\____/____/___|  \_/  |_____|____/|_| \_|____/ 
    
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
GITRESET

GITSBMDLINIT
libtoolize --force
aclocal
autoheader
automake --force-missing --add-missing
autoconf
./configure
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