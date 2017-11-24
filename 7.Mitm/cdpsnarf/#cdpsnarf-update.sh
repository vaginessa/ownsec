#does not work 16.04 24-5-17
#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/Zapotek/cdpsnarf.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/cdpsnarf/Zapotek/cdpsnarf
GITCONF=/opt/ITSEC/7.Mitm/cdpsnarf/Zapotek/cdpsnarf/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/cdpsnarf/Zapotek
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=cdpsnarf.desktop
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
  ____ ____  ____  ____  _   _    _    ____  _____ 
 / ___|  _ \|  _ \/ ___|| \ | |  / \  |  _ \|  ___|
| |   | | | | |_) \___ \|  \| | / _ \ | |_) | |_   
| |___| |_| |  __/ ___) | |\  |/ ___ \|  _ <|  _|  
 \____|____/|_|   |____/|_| \_/_/   \_\_| \_\_|    
        
INSTALL
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
make clean
GITRESET
GITSBMDLINIT
make -j 4
./cdpsnarf -h
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

