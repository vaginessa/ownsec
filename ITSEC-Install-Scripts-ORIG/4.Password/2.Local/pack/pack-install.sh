#!/bin/sh

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/iphelix/pack.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/pack/iphelix/pack 
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/pack/iphelix

EXECUTEABLE1=maskgen.py
EXECUTEABLE2=pack_maskgen
EXECUTEABLE3=policygen.py
EXECUTEABLE4=pack_poplicygen
EXECUTEABLE5=rulegen.py
EXECUTEABLE6=pack_rulegen
EXECUTEABLE7=statsgen.py
EXECUTEABLE8=pack_statsgen
#ph1b

DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/pack
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local/pack
DSKTPFL1=pack_maskgen.desktop
DSKTPFL2=pack_policygen.desktop
DSKTPFL3=pack_rulegen.desktop
DSKTPFL4=pack_statsgen.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/pack
#ph1a

echo "${bold}
 ____   _    ____ _  __
|  _ \ / \  / ___| |/ /
| |_) / _ \| |   | ' / 
|  __/ ___ \ |___| . \ 
|_| /_/   \_\____|_|\_\
                 
INSTALL  
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT


sudo rm -f $BINDIR/$EXECUTEABLE4
sudo rm -f $BINDIR/$EXECUTEABLE6
sudo rm -f $BINDIR/$EXECUTEABLE8
sudo rm -f $BINDIR/maskgen
sudo rm -f $BINDIR/poplicygen
sudo rm -f $BINDIR/rulegen
sudo rm -f $BINDIR/statsgen

CHMODXEX1
SYMLINKEX2TO1
CHMODXEX3
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE4
chmod +x $GITREPOROOT/$EXECUTEABLE5
sudo ln -s $GITREPOROOT/$EXECUTEABLE5 $BINDIR/$EXECUTEABLE6
chmod +x $GITREPOROOT/$EXECUTEABLE7
sudo ln -s $GITREPOROOT/$EXECUTEABLE7 $BINDIR/$EXECUTEABLE8

mkdir -p $DSKTPFLSDEST
rm -f $DSKTPFLSDEST/$DSKTPFL1
rm -f $DSKTPFLSDEST/$DSKTPFL2
rm -f $DSKTPFLSDEST/$DSKTPFL3
rm -f $DSKTPFLSDEST/$DSKTPFL4

cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
#333d
 cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2
#333d 
cp $DSKTPFLS/$DSKTPFL3 $DSKTPFLSDEST/$DSKTPFL3
#333d
cp $DSKTPFLS/$DSKTPFL4 $DSKTPFLSDEST/$DSKTPFL4

