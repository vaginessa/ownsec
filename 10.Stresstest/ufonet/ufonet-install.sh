#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/epsylon/ufonet
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/ufonet/epsylon/ufonet
GITCLONEDIR=/opt/ITSEC/10.Stresstest/ufonet/epsylon
EXECUTEABLE1=ufonet.sh
EXECUTEABLE2=ufonet
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/10.Stresstest
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest
DSKTPFL=ufonet.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _   _ _____ ___  _   _ _____ _____ 
| | | |  ___/ _ \| \ | | ____|_   _|
| | | | |_ | | | |  \| |  _|   | |  
| |_| |  _|| |_| | |\  | |___  | |  
 \___/|_|   \___/|_| \_|_____| |_|  
           
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT
#sudo python setup.py install

echo '#!/bin/bash
cd /opt/ITSEC/10.Stresstest/ufonet/epsylon/ufonet
./ufonet "$@"' > $EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
