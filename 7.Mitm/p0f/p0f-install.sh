#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/p0f/p0f.git
GITREPOROOT=/opt/ITSEC/7.Mitm/p0f/p0f/p0f
GITCLONEDIR=/opt/ITSEC/7.Mitm/p0f/p0f
EXECUTEABLE1=p0f.sh
EXECUTEABLE2=p0f
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=p0f.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____   ___  _____ 
|  _ \ / _ \|  ___|
| |_) | | | | |_   
|  __/| |_| |  _|  
|_|    \___/|_|    
             
INSTALL             
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

cd $GITREPOROOT
GITSBMDLINIT
make -j 4
echo '#!/bin/bash
cd /opt/ITSEC/7.Mitm/p0f/p0f/p0f
./p0f "$@"' > p0f.sh

chmod +x $GITREPOROOT/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL