#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/Trietptm-on-Security/Bella.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella/Trietptm-on-Security/Bella
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella/Trietptm-on-Security
EXECUTEABLE1=bella-builder.sh
EXECUTEABLE2=bella-builder
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor
DSKTPFL=bella-builder.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  _____ _     _        _    
| __ )| ____| |   | |      / \   
|  _ \|  _| | |   | |     / _ \  
| |_) | |___| |___| |___ / ___ \ 
|____/|_____|_____|_____/_/   \_\
             
INSTALL   
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO
cd $GITREPOROOT
GITSBMDLINIT
chmod +x BUILDER 
echo '#!/bin/bash
cd /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella/Trietptm-on-Security/Bella
./BUILDER "$@"' > $EXECUTEABLE1
chmod +x $EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL