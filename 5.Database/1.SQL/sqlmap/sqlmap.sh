#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)
	
GITREPOROOT=/opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap
EXECUTEABLE1=sqlmap.sh
EXECUTEABLE2=sqlmap
EXECUTEABLE3=sqlmapapi.sh
EXECUTEABLE4=sqlmapapi
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/5.Database/1.SQL
DSKTPFLSDEST=/home/$USER/.local/share/applications/5.Database/1.SQL
DSKTPFL=sqlmap.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
 ____   ___  _     __  __    _    ____  
/ ___| / _ \| |   |  \/  |  / \  |  _ \ 
\___ \| | | | |   | |\/| | / _ \ | |_) |
 ___) | |_| | |___| |  | |/ ___ \|  __/ 
|____/ \__\_\_____|_|  |_/_/   \_\_|    
              
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO

cd $GITREPOROOT
GITSBMDLINIT

echo '#!/bin/bash

cd /opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap

python sqlmap.py "$@"' > $EXECUTEABLE1

chmod +x $EXECUTEABLE1

echo '#!/bin/bash

cd /opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap

python sqlmapapi.py "$@"' > $EXECUTEABLE3

chmod +x $EXECUTEABLE3

sudo rm -f $BINDIR/$EXECUTEABLE2
sudo rm -f $BINDIR/$EXECUTEABLE4

sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE4
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
