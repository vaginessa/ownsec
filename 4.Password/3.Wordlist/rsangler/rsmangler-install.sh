#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/digininja/RSMangler
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/3.Wordlist/rsmangler/digininja/RSMangler
GITCLONEDIR=/opt/ITSEC/4.Password/3.Wordlist/rsmangler/digininja
EXECUTEABLE1=rsmangler.sh
EXECUTEABLE2=rsmangler
EXECUTEABLE3=rsmangler.rb
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/3.Wordlist
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/3.Wordlist
DSKTPFL=rsmangler.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  ____  __  __    _    _   _  ____ _     _____ ____  
|  _ \/ ___||  \/  |  / \  | \ | |/ ___| |   | ____|  _ \ 
| |_) \___ \| |\/| | / _ \ |  \| | |  _| |   |  _| | |_) |
|  _ < ___) | |  | |/ ___ \| |\  | |_| | |___| |___|  _ < 
|_| \_\____/|_|  |_/_/   \_\_| \_|\____|_____|_____|_| \_\
         
INSTALL
${normal}"

cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

echo '#!/bin/bash

cd /opt/ITSEC/4.Password/3.Wordlist/rsmangler/digininja/RSMangler

ruby rsmangler.rb "$@"' > $EXECUTEABLE1

chmod +x $GITREPOROOT/$EXECUTEABLE3
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL