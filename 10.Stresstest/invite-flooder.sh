#!/bin/bash

#http://www.hackingvoip.com/sec_tools.html

#http://www.hackingvoip.com/tools/inviteflood.tar.gz

echo "${bold}
 ___ _   ___     _____ _____ _____ _____ _     ___   ___  ____  _____ ____  
|_ _| \ | \ \   / /_ _|_   _| ____|  ___| |   / _ \ / _ \|  _ \| ____|  _ \ 
 | ||  \| |\ \ / / | |  | | |  _| | |_  | |  | | | | | | | | | |  _| | |_) |
 | || |\  | \ V /  | |  | | | |___|  _| | |__| |_| | |_| | |_| | |___|  _ < 
|___|_| \_|  \_/  |___| |_| |_____|_|   |_____\___/ \___/|____/|_____|_| \_\
          
${normal}"

mkdir -p /opt/ITSEC/10.Stresstest/invite-flooder

DOWNLOADDIR=/opt/ITSEC/10.Stresstest/invite-flooder
BINROOT=/opt/ITSEC/10.Stresstest/invite-flooder/inviteflood
#EXECUTEABLE1=pig.py
#EXECUTEABLE2=pig
EXECUTEABLE1=inviteflood
EXECUTEABLE2=inviteflood

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/10.Stresstest
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest
DSKTPFL=inviteflood.desktop

cd $DOWNLOADDIR
sudo rm /usr/local/bin/$EXECUTEABLE2
sudo updatedb
sudo ldconfig

wget http://www.hackingvoip.com/tools/hack_library.tar.gz -O hack_library.tar.gz
tar xvf hack_library.tar.gz
cd hack_library
make
cd $DOWNLOADDIR

wget http://www.hackingexposedvoip.com/tools/inviteflood.tar.gz -O inviteflood.tar.gz 
tar xvf inviteflood.tar.gz
cd inviteflood
make
#chmod +x $GITREPOROOT/$EXECUTEABLE1
#sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2

chmod +x $BINROOT/$EXECUTEABLE1
sudo ln -s $BINROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST && cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
