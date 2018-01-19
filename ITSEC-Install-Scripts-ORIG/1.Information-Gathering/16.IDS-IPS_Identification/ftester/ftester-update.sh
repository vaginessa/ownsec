#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/inversepath/ftester.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/ftester/inversepath/ftester
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/ftester/inversepath/ftester/.git
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
#hd6cv

echo "${bold}
 _____ _____ _____ ____ _____ _____ ____  
|  ___|_   _| ____/ ___|_   _| ____|  _ \ 
| |_    | | |  _| \___ \ | | |  _| | |_) |
|  _|   | | | |___ ___) || | | |___|  _ < 
|_|     |_| |_____|____/ |_| |_____|_| \_\
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

sudo rm $BINDIR/$EXECUTEABLE2
sudo rm $BINDIR/$EXECUTEABLE4
sudo rm $BINDIR/$EXECUTEABLE6

rm -f $EXECUTEABLE1
rm -f $EXECUTEABLE3
rm -f $EXECUTEABLE5

CHMODXEX2
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 $BINDIR/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE4
sudo ln -s $GITREPOROOT/$EXECUTEABLE4 $BINDIR/$EXECUTEABLE4
chmod +x $GITREPOROOT/$EXECUTEABLE6
sudo ln -s $GITREPOROOT/$EXECUTEABLE6 $BINDIR/$EXECUTEABLE6
1
2
3

#333d 
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
#333d 
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2
#333d
cp $DSKTPFLS/$DSKTPFL3 $DSKTPFLSDEST/$DSKTPFL3

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi