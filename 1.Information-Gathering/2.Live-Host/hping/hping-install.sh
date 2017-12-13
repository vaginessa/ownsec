#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/antirez/hping.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/hping3/antirez/hping 
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/hping3/antirez
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=hping3.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _   _ ____ ___ _   _  ____ 
| | | |  _ \_ _| \ | |/ ___|
| |_| | |_) | ||  \| | |  _ 
|  _  |  __/| || |\  | |_| |
|_| |_|_|  |___|_| \_|\____|
            
INSTALL
${normal}"


sudo rm -f /usr/sbin/hping
sudo rm -f /usr/sbin/hping2

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# sudo apt-get update
# sudo apt-get upgrade
# xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-hping.txt.txt") -r -- sudo apt-get install -y
### DEPS END

make clean
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT

sudo ln -s /usr/include/pcap/bpf.h /usr/include/net/bpf.h

./configure 
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL