#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/inversepath/ftester.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/ftester/inversepath/ftester
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/ftester/inversepath/ftester/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/ftester/inversepath
EXECUTEABLE2=ftest
EXECUTEABLE4=ftestd
EXECUTEABLE6=freport
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/16.IDS-IPS_Identification
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/16.IDS-IPS_Identification
DSKTPFL1=ftester.desktop
DSKTPFL2=ftestd.desktop
DSKTPFL3=freport.desktop
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
 _____ _____ _____ ____ _____ _____ ____  
|  ___|_   _| ____/ ___|_   _| ____|  _ \ 
| |_    | | |  _| \___ \ | | |  _| | |_) |
|  _|   | | | |___ ___) || | | |___|  _ < 
|_|     |_| |_____|____/ |_| |_____|_| \_\
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

sudo rm $BINDIR/$EXECUTEABLE2
sudo rm $BINDIR/$EXECUTEABLE4
sudo rm $BINDIR/$EXECUTEABLE6

rm -f $EXECUTEABLE1
rm -f $EXECUTEABLE3
rm -f $EXECUTEABLE5

chmod +x $GITREPOROOT/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 $BINDIR/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE4
sudo ln -s $GITREPOROOT/$EXECUTEABLE4 $BINDIR/$EXECUTEABLE4
chmod +x $GITREPOROOT/$EXECUTEABLE6
sudo ln -s $GITREPOROOT/$EXECUTEABLE6 $BINDIR/$EXECUTEABLE6
rm -f $DSKTPFLSDEST/$DSKTPFL1
rm -f $DSKTPFLSDEST/$DSKTPFL2
rm -f $DSKTPFLSDEST/$DSKTPFL3

mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL3 $DSKTPFLSDEST/$DSKTPFL3

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi
