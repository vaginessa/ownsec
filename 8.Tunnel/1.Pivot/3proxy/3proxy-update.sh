#!/bin/bash

#make not working

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/z3APA3A/3proxy
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/1.Pivot/3proxy/z3APA3A/3proxy
GITCONFDIR=/opt/ITSEC/8.Tunnel/1.Pivot/3proxy/z3APA3A/3proxy/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/1.Pivot/3proxy/z3APA3A
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel/1.Pivot
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/1.Pivot
DSKTPFL=3proxy.desktop
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
 _____ ____  ____   _____  ____   __
|___ /|  _ \|  _ \ / _ \ \/ /\ \ / /
  |_ \| |_) | |_) | | | \  /  \ V / 
 ___) |  __/|  _ <| |_| /  \   | |  
|____/|_|   |_| \_\\___/_/\_\  |_|  
         
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
make clean
GITRESET
GITSBMDLINIT


make -f makefile.unix
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
