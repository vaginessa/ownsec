#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/malfunkt/hyperfox.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/hyperfox/malfunkt/hyperfox
GITCONFDIR=/opt/ITSEC/7.Mitm/hyperfox/malfunkt/hyperfox/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/hyperfox/malfunkt
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL1=hyperfox.desktop
DSKTPFL1=arpfox.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _   ___   ______  _____ ____  _____ _____  __
| | | \ \ / /  _ \| ____|  _ \|  ___/ _ \ \/ /
| |_| |\ V /| |_) |  _| | |_) | |_ | | | \  / 
|  _  | | | |  __/| |___|  _ <|  _|| |_| /  \ 
|_| |_| |_| |_|   |_____|_| \_\_|   \___/_/\_\
  
      
    _    ____  ____  _____ _____  __
   / \  |  _ \|  _ \|  ___/ _ \ \/ /
  / _ \ | |_) | |_) | |_ | | | \  / 
 / ___ \|  _ <|  __/|  _|| |_| /  \ 
/_/   \_\_| \_\_|   |_|   \___/_/\_\
           
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
#cd /opt/ITSEC/7.Mitm/hyperfox/malfunkt/hyperfox
curl -sL 'https://raw.githubusercontent.com/malfunkt/hyperfox/$BRANCH/install.sh' | sh
curl -sL 'https://raw.githubusercontent.com/malfunkt/arpfox/$BRANCH/install.sh' | sh

sudo updatedb 
sudo ldconfig

#sudo ln -s /opt/ITSEC/7.Mitm/hyperfox/malfunkt/hyperfox/hyperfox.sh /usr/local/bin/hyperfox
sudo rm -f /usr/local/bin/hyperfox
sudo rm -f /usr/local/bin/arpfox
mkdir -p $DSKTPFLSDEST
sudo rm -f $DSKTPFLSDEST/$DSKTPFL1
sudo rm -f $DSKTPFLSDEST/$DSKTPFL2
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi
