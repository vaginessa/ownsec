#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   ___   ______  _____ ____  _____ _____  __
| | | \ \ / /  _ \| ____|  _ \|  ___/ _ \ \/ /
| |_| |\ V /| |_) |  _| | |_) | |_ | | | \  / 
|  _  | | | |  __/| |___|  _ <|  _|| |_| /  \ 
|_| |_| |_| |_|   |_____|_| \_\_|   \___/_/\_\
  
      
    _    ____  ____  _____ _____  __
   / \  |  _ \|  _ \|  ___/ _ \ \/ /
  / _ \ | |_) | |_) | |_ | | | \  / 
 / ___ \|  _ <|  __/|  _|| |_| /  \ 
/_/   \_\_| \_\_|   |_|   \___/_/\_\
           
${normal}"

mkdir -p /opt/ITSEC/7.Mitm/hyperfox/malfunkt
cd /opt/ITSEC/7.Mitm/hyperfox/malfunkt
git clone https://github.com/malfunkt/hyperfox.git

GITREPOROOT=/opt/ITSEC/7.Mitm/hyperfox/malfunkt/hyperfox

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL1=hyperfox.desktop
DSKTPFL1=arpfox.desktop

sudo rm -f $DSKTPFLSDEST/$DSKTPFL1
sudo rm -f $DSKTPFLSDEST/$DSKTPFL2
sudo rm -f /usr/local/bin/hyperfox
sudo rm -f /usr/local/bin/arpfox

#cd /opt/ITSEC/7.Mitm/hyperfox/malfunkt/hyperfox
curl -sL 'https://raw.githubusercontent.com/malfunkt/hyperfox/master/install.sh' | sh
curl -sL 'https://raw.githubusercontent.com/malfunkt/arpfox/master/install.sh' | sh

sudo updatedb 
sudo ldconfig

#sudo ln -s /opt/ITSEC/7.Mitm/hyperfox/malfunkt/hyperfox/hyperfox.sh /usr/local/bin/hyperfox
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2