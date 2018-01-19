#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/malfunkt/hyperfox.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/hyperfox/malfunkt/hyperfox
GITCONFDIR=/opt/ITSEC/7.Mitm/hyperfox/malfunkt/hyperfox/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/hyperfox/malfunkt
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/hyperfox
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/hyperfox
DSKTPFL1=hyperfox.desktop
DSKTPFL1=arpfox.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/hyperfox
#ph1a

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
           
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC

GITRESET
GITSBMDLINIT
#cd /opt/ITSEC/7.Mitm/hyperfox/malfunkt/hyperfox
curl -sL 'https://raw.githubusercontent.com/malfunkt/hyperfox/$BRANCH/install.sh' | sh
curl -sL 'https://raw.githubusercontent.com/malfunkt/arpfox/$BRANCH/install.sh' | sh

sudo updatedb 
sudo ldconfig

#sudo ln -s /opt/ITSEC/7.Mitm/hyperfox/malfunkt/hyperfox/hyperfox.sh /usr/local/bin/hyperfox
sudo rm -f /usr/local/bin/hyperfox
sudo rm -f /usr/local/bin/arpfox
#333d
sudo 1
sudo 2
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi
