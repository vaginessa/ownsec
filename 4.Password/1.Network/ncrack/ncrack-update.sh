#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)



GITREPO=https://github.com/nmap/ncrack.git
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/ncrack/nmap/ncrack
GITCONFDIR=/opt/ITSEC/4.Password/1.Network/ncrack/nmap/ncrack/.git
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/ncrack/nmap
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network
DSKTPFL=ncrack.desktop
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
 _   _  ____ ____      _    ____ _  __
| \ | |/ ___|  _ \    / \  / ___| |/ /
|  \| | |   | |_) |  / _ \| |   | ' / 
| |\  | |___|  _ <  / ___ \ |___| . \ 
|_| \_|\____|_| \_\/_/   \_\____|_|\_\
          
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

sudo make uninstall
make clean
GITRESET
GITSBMDLINIT

./configure
make -j 4
sudo make install

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi


