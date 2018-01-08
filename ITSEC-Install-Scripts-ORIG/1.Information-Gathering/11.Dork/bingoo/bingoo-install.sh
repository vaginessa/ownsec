#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/Hood3dRob1n/BinGoo.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/11.Dork/bingoo/Hood3dRob1n/BinGoo
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/11.Dork/bingoo/Hood3dRob1n
EXECUTEABLE1=bingoo
EXECUTEABLE2=bingoo.sh
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/11.Dork/bingoo
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/11.Dork/bingoo
DSKTPFL=bingoo.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
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

echo '#!/bin/bash -i

cd /opt/ITSEC/1.Information-Gathering/11.Dork/bingoo/Hood3dRob1n/BinGoo

./bingoo "$@"' > $EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE2
sudo rm -f $BINDIR/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 $BINDIR/$EXECUTEABLE1

mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
