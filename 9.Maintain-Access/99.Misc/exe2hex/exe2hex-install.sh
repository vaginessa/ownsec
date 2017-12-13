#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/g0tmi1k/exe2hex.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/99.Misc/exe2hex/g0tmi1k/exe2hex
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/99.Misc/exe2hex/g0tmi1k
EXECUTEABLE1=exe2hex.sh
EXECUTEABLE2=exe2hex
EXECUTEABLE3=exe2hex.py
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/9.Maintain-Access/99.Misc
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/99.Misc
DSKTPFL=exe2hex.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _______  _______ ____  _   _ _______  __
| ____\ \/ / ____|___ \| | | | ____\ \/ /
|  _|  \  /|  _|   __) | |_| |  _|  \  / 
| |___ /  \| |___ / __/|  _  | |___ /  \ 
|_____/_/\_\_____|_____|_| |_|_____/_/\_\
            
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
## Installed w apt lists - see /opt/ITSEC-Install-Scripts/0.Initial/lst/apt
# sudo apt-get update
# sudo apt-get upgrade
# xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-exe2hex.txt") -r -- sudo apt-get install -y
### DEPS END

APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT

echo '#!/bin/bash

cd /opt/ITSEC/9.Maintain-Access/99.Misc/exe2hex/g0tmi1k/exe2hex

python3 exe2hex.py "$@"' > $EXECUTEABLE1
chmod +x $EXECUTEABLE1
chmod +x $EXECUTEABLE3
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

