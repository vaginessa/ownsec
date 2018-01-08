#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/M4sc3r4n0/Evil-Droid
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/4.Android-Backdoor/evil-droid/M4sc3r4n0/Evil-Droid
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/4.Android-Backdoor/evil-droid/M4sc3r4n0
EXECUTEABLE1=evil-droid
EXECUTEABLE2=evil-droid
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/4.Android-Backdoor
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/4.Android-Backdoor
DSKTPFL=evil-droid.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
 _______     _____ _          ____  ____   ___ ___ ____  
| ____\ \   / /_ _| |        |  _ \|  _ \ / _ \_ _|  _ \ 
|  _|  \ \ / / | || |   _____| | | | |_) | | | | || | | |
| |___  \ V /  | || |__|_____| |_| |  _ <| |_| | || |_| |
|_____|  \_/  |___|_____|    |____/|_| \_\\___/___|____/ 
                                                         
INSTALL   
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

chmod +x $EXECUTEABLE1

sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL