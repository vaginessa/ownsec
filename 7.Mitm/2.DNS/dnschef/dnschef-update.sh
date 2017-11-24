#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/iphelix/dnschef.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/2.DNS/dnschef/iphelix/dnschef
GITCONFDIR=/opt/ITSEC/7.Mitm/2.DNS/dnschef/iphelix/dnschef/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/2.DNS/dnschef/iphelix
EXECUTEABLE1=dnschef.sh
EXECUTEABLE2=dnschef
EXECUTEABLE3=dnschef.py
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm/2.DNS
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/2.DNS
DSKTPFL=dnschef.desktop
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
 ____  _   _ ____   ____ _   _ _____ _____ 
|  _ \| \ | / ___| / ___| | | | ____|  ___|
| | | |  \| \___ \| |   | |_| |  _| | |_   
| |_| | |\  |___) | |___|  _  | |___|  _|  
|____/|_| \_|____/ \____|_| |_|_____|_|    
           
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

cd /opt/ITSEC/7.Mitm/2.DNS/dnschef/iphelix/dnschef

python dnschef.py "$@"' > $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE3
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
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

