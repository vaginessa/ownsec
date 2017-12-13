#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/Veil-Framework/Veil-Evasion
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/veil-evasion/Veil-Framework/Veil-Evasion
GITCONFDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/veil-evasion/Veil-Framework/Veil-Evasion/.git
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/veil-evasion/Veil-Framework
EXECUTEABLE1=Veil-Evasion.py
EXECUTEABLE2=veil-evasion
BINDIR=/usr/local/bin
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
__     _______ ___ _          _______     ___    ____ ___ ___  _   _ 
\ \   / / ____|_ _| |        | ____\ \   / / \  / ___|_ _/ _ \| \ | |
 \ \ / /|  _|  | || |   _____|  _|  \ \ / / _ \ \___ \| | | | |  \| |
  \ V / | |___ | || |__|_____| |___  \ V / ___ \ ___) | | |_| | |\  |
   \_/  |_____|___|_____|    |_____|  \_/_/   \_\____/___\___/|_| \_|
            
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


cd 
GITRESET
GITSBMDLINIT

sed -i 's/wine-stable/wine/' /opt/ITSEC/9.Maintain-Access/2.Generate/veil-evasion/Veil-Framework/Veil-Evasion/setup/setup.sh
#git submodule init && git submodule update --recursive

sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi
