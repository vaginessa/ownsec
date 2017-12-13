#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/RUB-SysSec/OMEN
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/3.Wordlist/omen/RUB-SysSec/OMEN
GITCONFDIR=/opt/ITSEC/4.Password/3.Wordlist/omen/RUB-SysSec/OMEN/.git
GITCLONEDIR=/opt/ITSEC/4.Password/3.Wordlist/omen/RUB-SysSec
EXECUTEABLE1=omen-createNG.sh
EXECUTEABLE2=omen-createNG
EXECUTEABLE3=omen-enumNG.sh
EXECUTEABLE4=omen-enumNG
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/3.Wordlist
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/3.Wordlist
DSKTPFL=omen.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/master
	git pull
}
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
  ___  __  __ _____ _   _ 
 / _ \|  \/  | ____| \ | |
| | | | |\/| |  _| |  \| |
| |_| | |  | | |___| |\  |
 \___/|_|  |_|_____|_| \_|
                          
/RUB-SysSec/OMEN 
UPDATE
${normal}"

if [ ! -d $GITCONFDIR ]

then

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO

else

echo "${bold}REPO EXISTS, skip clone...${normal}"

fi

cd $GITREPOROOT

if git checkout master &&
    git fetch origin master &&
    [ `git rev-list HEAD...origin/master --count` != 0 ] &&
    git merge origin/master
then
    
cd $GITREPOROOT
GITRESET
GITSBMDLINIT

make

echo '#!/bin/bash
cd /opt/ITSEC/4.Password/3.Wordlist/omen/RUB-SysSec/OMEN
./createNG "$@" ' > $EXECUTEABLE1

echo '#!/bin/bash
cd /opt/ITSEC/4.Password/3.Wordlist/omen/RUB-SysSec/OMEN
./createNG "$@" ' > $EXECUTEABLE3

chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE3
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo rm -f $BINDIR/$EXECUTEABLE4
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE4
mkdir -p $DSKTPFLSDEST
rm -f $DSKTPFLSDEST/$DSKTPFL
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi