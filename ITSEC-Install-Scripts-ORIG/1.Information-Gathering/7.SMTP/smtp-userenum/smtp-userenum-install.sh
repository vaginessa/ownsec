#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/pentestmonkey/smtp-user-enum.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/7.SMTP/smtp-user-enum/pentestmonkey/smtp-user-enum
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/7.SMTP/smtp-user-enum/pentestmonkey
EXECUTEABLE1=smtp-user-enum.pl
EXECUTEABLE2=smtp-user-enum
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/7.SMTP/smtp-user-enum
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/7.SMTP/smtp-user-enum
DSKTPFL=smtp-user-enum.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  __  __ _____ ____  _   _ ____  ____  _____ _   _ _   _ __  __ 
/ ___||  \/  |_   _|  _ \| | | / ___||  _ \| ____| \ | | | | |  \/  |
\___ \| |\/| | | | | |_) | | | \___ \| |_) |  _| |  \| | | | | |\/| |
 ___) | |  | | | | |  __/| |_| |___) |  _ <| |___| |\  | |_| | |  | |
|____/|_|  |_| |_| |_|    \___/|____/|_| \_\_____|_| \_|\___/|_|  |_|
        
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
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL