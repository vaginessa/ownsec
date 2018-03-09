#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/inversepath/ftester.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/ftester/inversepath/ftester
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/ftester/inversepath
EXECUTEABLE2=ftest
EXECUTEABLE4=ftestd
EXECUTEABLE6=freport
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/16.IDS-IPS_Identification/ftester
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/16.IDS-IPS_Identification/ftester
DSKTPFL1=ftester.desktop
DSKTPFL2=ftestd.desktop
DSKTPFL3=freport.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/16.IDS-IPS_Identification/ftester
#ph1a

echo "${bold}
 _____ _____ _____ ____ _____ _____ ____  
|  ___|_   _| ____/ ___|_   _| ____|  _ \ 
| |_    | | |  _| \___ \ | | |  _| | |_) |
|  _|   | | | |___ ___) || | | |___|  _ < 
|_|     |_| |_____|____/ |_| |_____|_| \_\
            
INSTALL  
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-ftester.txt") -r -- sudo apt-get install -y
### DEPS END

GITSBMDLINIT

CHMODXEX2
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 $BINDIR/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE4
sudo ln -s $GITREPOROOT/$EXECUTEABLE4 $BINDIR/$EXECUTEABLE4
chmod +x $GITREPOROOT/$EXECUTEABLE6
sudo ln -s $GITREPOROOT/$EXECUTEABLE6 $BINDIR/$EXECUTEABLE6

mkdir -p $DSKTPFLSDEST
rm -f $DSKTPFLSDEST/$DSKTPFL1
rm -f $DSKTPFLSDEST/$DSKTPFL2
rm -f $DSKTPFLSDEST/$DSKTPFL3

cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
#333d 
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2
#333d
cp $DSKTPFLS/$DSKTPFL3 $DSKTPFLSDEST/$DSKTPFL3
