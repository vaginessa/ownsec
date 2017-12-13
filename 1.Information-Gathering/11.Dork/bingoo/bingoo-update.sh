#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/Hood3dRob1n/BinGoo.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/11.Dork/bingoo/Hood3dRob1n/BinGoo
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/11.Dork/bingoo/Hood3dRob1n/BinGoo/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/11.Dork/bingoo/Hood3dRob1n
EXECUTEABLE1=bingoo
EXECUTEABLE2=bingoo.sh
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/11.Dork
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/11.Dork
DSKTPFL=bingoo.desktop
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
 ____ ___ _   _  ____  ___   ___  
| __ )_ _| \ | |/ ___|/ _ \ / _ \ 
|  _ \| ||  \| | |  _| | | | | | |
| |_) | || |\  | |_| | |_| | |_| |
|____/___|_| \_|\____|\___/ \___/ 
    
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

echo '#!/bin/bash -i

cd /opt/ITSEC/1.Information-Gathering/11.Dork/bingoo/Hood3dRob1n/BinGoo
./bingoo "$@"' > $EXECUTEABLE2

chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE2
sudo rm -f $BINDIR/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 $BINDIR/$EXECUTEABLE1

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
