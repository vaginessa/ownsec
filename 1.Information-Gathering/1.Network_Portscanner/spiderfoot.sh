#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
           _     _            __             _   
 ___ _ __ (_) __| | ___ _ __ / _| ___   ___ | |_ 
/ __| '_ \| |/ _  |/ _ \ '__| |_ / _ \ / _ \| __|
\__ \ |_) | | (_| |  __/ |  |  _| (_) | (_) | |_ 
|___/ .__/|_|\__,_|\___|_|  |_|  \___/ \___/ \__|
    |_|    
${normal}"

mkdir -p /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/spiderfoot/smicallef
cd /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/spiderfoot/smicallef
git clone https://github.com/smicallef/spiderfoot.git

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/spiderfoot/smicallef/spiderfoot

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFL1=spiderfoot.desktop
DSKTPFL2=spiderfoot_cli.desktop

cd $GITREPOROOT
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive

sudo -H pip2 install lxml netaddr M2Crypto cherrypy mako requests bs4
#sudo python setup.py install 

echo '#!/bin/bash

cd /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/spiderfoot/smicallef/spiderfoot

python sf.py "$@"' > sf.sh
chmod +x sf.sh

echo '#!/bin/bash

cd /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/spiderfoot/smicallef/spiderfoot

python sfcli.py "$@"' > sfcli.sh
chmod +x sfcli.sh

sudo ln -s $GITREPOROOT/sf.sh /usr/local/bin/spiderfoot
sudo ln -s $GITREPOROOT/sfcli.sh /usr/local/bin/spiderfoot_cli
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2

