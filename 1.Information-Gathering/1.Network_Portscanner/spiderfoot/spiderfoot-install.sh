#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/smicallef/spiderfoot.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/spiderfoot/smicallef/spiderfoot
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/spiderfoot/smicallef
EXECUTEABLE1=sf.sh
EXECUTEABLE2=spiderfoot
EXECUTEABLE3=sfcli.sh
EXECUTEABLE4=spiderfoot_cli
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFL1=spiderfoot.desktop
DSKTPFL2=spiderfoot_cli.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  ____ ___ ____  _____ ____  _____ ___   ___ _____ 
/ ___||  _ \_ _|  _ \| ____|  _ \|  ___/ _ \ / _ \_   _|
\___ \| |_) | || | | |  _| | |_) | |_ | | | | | | || |  
 ___) |  __/| || |_| | |___|  _ <|  _|| |_| | |_| || |  
|____/|_|  |___|____/|_____|_| \_\_|   \___/ \___/ |_|  
                         
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

make clean
GITSBMDLINIT

sudo -H pip2 install lxml netaddr M2Crypto cherrypy mako requests bs4
#sudo python setup.py install 

echo '#!/bin/bash

cd /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/spiderfoot/smicallef/spiderfoot

python sf.py "$@"' > $EXECUTEABLE1
chmod +x $EXECUTEABLE1

echo '#!/bin/bash

cd /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/spiderfoot/smicallef/spiderfoot

python sfcli.py "$@"' > $EXECUTEABLE3
chmod +x $EXECUTEABLE3

sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE4
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2

