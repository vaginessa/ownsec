#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/digininja/twofi.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/twofi/digininja/twofi
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/twofi/digininja/twofi/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/twofi/digininja
EXECUTEABLE1=twofi.rb
EXECUTEABLE2=twofi
EXECUTEABLE3=twofi.sh
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFL=twofi.desktop
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
 _______        _____  _____ ___ 
|_   _\ \      / / _ \|  ___|_ _|
  | |  \ \ /\ / / | | | |_   | | 
  | |   \ V  V /| |_| |  _|  | | 
  |_|    \_/\_/  \___/|_|   |___|
UPDATE
${normal}"

. ~/.bashrc
eval "$(rbenv init -)"
yes "N" | rbenv install 2.4.1
rbenv rehash
rbenv shell 2.4.1

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
bundle install

echo '#!/bin/bash -i

cd /opt/ITSEC/1.Information-Gathering/13.OSINT/twofi/digininja/twofi
source ~/.bashrc
eval "$(rbenv init -)"
rbenv shell 2.4.1

./twofi.rb "$*" ' > $EXECUTEABLE3

chmod +x $GITREPOROOT/$EXECUTEABLE3
chmod a+x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE2
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