#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/pentestmonkey/smtp-user-enum.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/7.SMTP/smtp-user-enum/pentestmonkey/smtp-user-enum
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/7.SMTP/smtp-user-enum/pentestmonkey/smtp-user-enum/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/7.SMTP/smtp-user-enum/pentestmonkey
EXECUTEABLE1=smtp-user-enum.pl
EXECUTEABLE2=smtp-user-enum
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/7.SMTP
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/7.SMTP
DSKTPFL=smtp-user-enum.desktop
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
 ____  __  __ _____ ____  _   _ ____  ____  _____ _   _ _   _ __  __ 
/ ___||  \/  |_   _|  _ \| | | / ___||  _ \| ____| \ | | | | |  \/  |
\___ \| |\/| | | | | |_) | | | \___ \| |_) |  _| |  \| | | | | |\/| |
 ___) | |  | | | | |  __/| |_| |___) |  _ <| |___| |\  | |_| | |  | |
|____/|_|  |_| |_| |_|    \___/|____/|_| \_\_____|_| \_|\___/|_|  |_|
        
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

APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT

chmod +x $GITREPOROOT/$EXECUTEABLE1
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