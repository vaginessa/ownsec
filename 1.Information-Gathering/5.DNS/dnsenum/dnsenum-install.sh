#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/fwaeytens/dnsenum.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens/dnsenum
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens
EXECUTEABLE1=dnsenum.sh 
EXECUTEABLE2=dnsenum
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFL=dnsenum.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  _   _ ____  _____ _   _ _   _ __  __ 
|  _ \| \ | / ___|| ____| \ | | | | |  \/  |
| | | |  \| \___ \|  _| |  \| | | | | |\/| |
| |_| | |\  |___) | |___| |\  | |_| | |  | |
|____/|_| \_|____/|_____|_| \_|\___/|_|  |_|
           
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# sudo apt-get update
# sudo apt-get upgrade
# xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-dnsenum.txt") -r -- sudo apt-get install -y
### DEPS END

GITSBMDLINIT

echo "#!/bin/bash 
cd /opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens/dnsenum
perl dnsenum.pl" > $EXECUTEABLE1

chmod +x $EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

