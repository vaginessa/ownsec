#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/USArmyResearchLab/Dshell
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/2.DNS/dshell/USArmyResearchLab/Dshell
GITCONFDIR=/opt/ITSEC/7.Mitm/2.DNS/dshell/USArmyResearchLab/Dshell/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/2.DNS/dshell/USArmyResearchLab
#EXECUTEABLE1=
EXECUTEABLE2=dshell
EXECUTEABLE3=dshell-decode
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/2.DNS/dshell
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/2.DNS/dshell
DSKTPFL1=dshell.desktop
DSKTPFL2=dshell-decode.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/2.DNS/dshell
#ph1a

echo "${bold}
 ____  ____  _   _ _____ _     _     
|  _ \/ ___|| | | | ____| |   | |    
| | | \___ \| |_| |  _| | |   | |    
| |_| |___) |  _  | |___| |___| |___ 
|____/|____/|_| |_|_____|_____|_____|
         
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC

make clean
git clean -f 
GITSBMDLINIT
#Build
make -j 4


sudo rm -f $BINDIR/$EXECUTEABLE3
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE3

mkdir -p $DSKTPFLSDEST
rm -f $DSKTPFLSDEST/$DSKTPFL1
rm -f $DSKTPFLSDEST/$DSKTPFL2
#333d
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

