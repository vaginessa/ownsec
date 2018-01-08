#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/airtrack/stunnel.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/stunnel/airtrack/stunnel
GITCONFDIR=/opt/ITSEC/8.Tunnel/stunnel/airtrack/stunnel/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/stunnel/airtrack
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnell/stunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnell/stunnel
DSKTPFL=stunnel.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnell/stunnelp

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
 ____ _____ _   _ _   _ _   _ _____ _     
/ ___|_   _| | | | \ | | \ | | ____| |    
\___ \ | | | | | |  \| |  \| |  _| | |    
 ___) || | | |_| | |\  | |\  | |___| |___ 
|____/ |_|  \___/|_| \_|_| \_|_____|_____|
             
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

cargo build -v --release
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