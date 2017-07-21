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

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/spiderfoot/smicallef/spiderfoot
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFL1=spiderfoot.desktop
DSKTPFL2=spiderfoot_cli.desktop

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else


cd $GITREPOROOT

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

sudo rm -f /usr/local/bin/spiderfoot
sudo rm -f /usr/local/bin/spiderfoot_cli
sudo ln -s $GITREPOROOT/sf.sh /usr/local/bin/spiderfoot
sudo ln -s $GITREPOROOT/sfcli.sh /usr/local/bin/spiderfoot_cli
rm -f $DSKTPFLSDEST/$DSKTPFL1
rm -f $DSKTPFLSDEST/$DSKTPFL2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2

fi