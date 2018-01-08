#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/iphelix/dnschef.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/2.DNS/dnschef/iphelix/dnschef
GITCLONEDIR=/opt/ITSEC/7.Mitm/2.DNS/dnschef/iphelix
EXECUTEABLE1=dnschef.sh
EXECUTEABLE2=dnschef
EXECUTEABLE3=dnschef.py
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/7.Mitm/2.DNS
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/2.DNS
DSKTPFL=dnschef.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
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

echo '#!/bin/bash 

cd /opt/ITSEC/7.Mitm/2.DNS/dnschef/iphelix/dnschef

python dnschef.py "$@"' > $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE3
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
