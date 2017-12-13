#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=git://git.kali.org/packages/wol-e.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/wol-e/dookie/wol-e
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/wol-e/dookie
EXECUTEABLE1=wol-e.py
EXECUTEABLE2=wol-e
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=wol-e.desktop
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
__        _____  _          _____ 
\ \      / / _ \| |        | ____|
 \ \ /\ / / | | | |   _____|  _|  
  \ V  V /| |_| | |__|_____| |___ 
   \_/\_/  \___/|_____|    |_____|
            
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

rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

#foreman s

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi
