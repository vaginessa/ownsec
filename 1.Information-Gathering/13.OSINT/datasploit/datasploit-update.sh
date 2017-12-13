#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/DataSploit/datasploit.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/datasploit/DataSploit/datasploit
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/datasploit/DataSploit/datasploit/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/datasploit/DataSploit
EXECUTEABLE1=datasploit.py
EXECUTEABLE2=datasploit
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFL=datasploit.desktop
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
PIPRQRMNTS () {
	sudo -H pip install -r requirements.txt
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____    _  _____  _    ____  ____  _     ___ ___ _____ 
|  _ \  / \|_   _|/ \  / ___||  _ \| |   / _ \_ _|_   _|
| | | |/ _ \ | | / _ \ \___ \| |_) | |  | | | | |  | |  
| |_| / ___ \| |/ ___ \ ___) |  __/| |__| |_| | |  | |  
|____/_/   \_\_/_/   \_\____/|_|   |_____\___/___| |_|  
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
PIPRQRMNTS

mv config_sample.py config.py
# vim config.py

# python datasploit.py test.com

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
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
