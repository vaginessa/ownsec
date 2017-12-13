#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/g0tmi1k/exe2hex.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/99.Misc/exe2hex/g0tmi1k/exe2hex
GITCONFDIR=/opt/ITSEC/9.Maintain-Access/99.Misc/exe2hex/g0tmi1k/exe2hex/.git
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/99.Misc/exe2hex/g0tmi1k
EXECUTEABLE1=exe2hex.sh
EXECUTEABLE2=exe2hex
EXECUTEABLE3=exe2hex.py
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/9.Maintain-Access/99.Misc
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/99.Misc
DSKTPFL=exe2hex.desktop
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
 _______  _______ ____  _   _ _______  __
| ____\ \/ / ____|___ \| | | | ____\ \/ /
|  _|  \  /|  _|   __) | |_| |  _|  \  / 
| |___ /  \| |___ / __/|  _  | |___ /  \ 
|_____/_/\_\_____|_____|_| |_|_____/_/\_\
        
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

echo '#!/bin/bash

cd /opt/ITSEC/9.Maintain-Access/99.Misc/exe2hex/g0tmi1k/exe2hex

python3 exe2hex.py "$@"' > $EXECUTEABLE1
chmod +x $EXECUTEABLE1
chmod +x $EXECUTEABLE3
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
rm -f  $DSKTPFLSDEST/$DSKTPFL
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


