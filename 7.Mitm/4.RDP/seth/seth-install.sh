#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/SySS-Research/Seth
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/seth/SySS-Research/Seth
GITCLONEDIR=/opt/ITSEC/7.Mitm/seth/SySS-Research
EXECUTEABLE1=seth.sh
EXECUTEABLE2=seth
EXECUTEABLE3=seth.py
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/7.Mitm/4.RDP
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/4.RDP
DSKTPFL=seth.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
 ____  _____ _____ _   _ 
/ ___|| ____|_   _| | | |
\___ \|  _|   | | | |_| |
 ___) | |___  | | |  _  |
|____/|_____| |_| |_| |_|
                         
INSTALL /SySS-Research/Seth
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# python3 tcpdump arpspoof openssl
# arpspoof is part of dsniff

sudo -H pip2 install -r requirements.txt 
sudo updatedb
sudo ldconfig

### DEPS END

GITSBMDLINIT

echo '#!/bin/bash -i 

cd /opt/ITSEC/7.Mitm/seth/SySS-Research/Seth
python seth.py "$@"' > $GITREPOROOT/$EXECUTEABLE1

chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE3
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
