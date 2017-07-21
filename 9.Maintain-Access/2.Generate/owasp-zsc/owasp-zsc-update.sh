#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
  _____        ___    ____  ____      _________   ____ 
 / _ \ \      / / \  / ___||  _ \    |__  / ___| / ___|
| | | \ \ /\ / / _ \ \___ \| |_) |____ / /\___ \| |    
| |_| |\ V  V / ___ \ ___) |  __/_____/ /_ ___) | |___ 
 \___/  \_/\_/_/   \_\____/|_|       /____|____/ \____|
                 
${normal}"

GITREPOROOT=/opt/ITSEC/9.Maintain-Access/2.Generate/owasp-zsc/zscproject/OWASP-ZSC
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/9.Maintain-Access/2.Generate
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/2.Generate
DSKTPFL=owasp-zsc.desktop

if [ ! -d $GITREPOGITFILE ]

then


mkdir -p /opt/ITSEC/9.Maintain-Access/2.Generate/owasp-zsc/zscproject
cd /opt/ITSEC/9.Maintain-Access/2.Generate/owasp-zsc/zscproject
git clone https://github.com/zscproject/OWASP-ZSC

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init && git submodule update --recursive

sudo python installer.py
rm -f  $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi

