#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/SySS-Research/Seth
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/seth/SySS-Research/Seth
GITCONFDIR=/opt/ITSEC/7.Mitm/seth/SySS-Research/Seth/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/seth/SySS-Research
EXECUTEABLE1=seth.sh
EXECUTEABLE2=seth
EXECUTEABLE3=seth.py
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm/4.RDP
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/4.RDP
DSKTPFL=seth.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
 ____  _____ _____ _   _ 
/ ___|| ____|_   _| | | |
\___ \|  _|   | | | |_| |
 ___) | |___  | | |  _  |
|____/|_____| |_| |_| |_|
                         
UPDATE /SySS-Research/Seth
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
GITSBMDLINIT
sudo -H pip2 install -r requirements.txt 
sudo updatedb
sudo ldconfig

echo '#!/bin/bash -i 

cd /opt/ITSEC/7.Mitm/seth/SySS-Research/Seth
python seth.py "$@"' > $GITREPOROOT/$EXECUTEABLE1

chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE3
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

