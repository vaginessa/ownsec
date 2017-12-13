#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/wireshark/wireshark.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/wireshark/wireshark/wireshark
GITCLONEDIR=/opt/ITSEC/7.Mitm/wireshark/wireshark
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=wireshark.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
__        _____ ____  _____ ____  _   _    _    ____  _  __
\ \      / /_ _|  _ \| ____/ ___|| | | |  / \  |  _ \| |/ /
 \ \ /\ / / | || |_) |  _| \___ \| |_| | / _ \ | |_) | ' / 
  \ V  V /  | ||  _ <| |___ ___) |  _  |/ ___ \|  _ <| . \ 
   \_/\_/  |___|_| \_\_____|____/|_| |_/_/   \_\_| \_\_|\_\
           
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT
#cd build
#sudo make uninstall
cd $GITREPOROOT

### DEPS:
## Installed w apt lists - see /opt/ITSEC-Install-Scripts/0.Initial/lst/apt
# sudo apt-get update
# sudo apt-get upgrade
# xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-wireshark.txt") -r -- sudo apt-get install -y
### DEPS END

sudo rm -r build
make clean 
GITSBMDLINIT
#mkdir build
#cd build
#cmake ..
./autogen.sh
./configure --with-gtk=3 --with-qt=no --with-ssl --enable-dumpcap --enable-setcap-install --enable-tfshark --enable-wireshark
make -j 4
sudo make install
 
cd $GITREPOROOT
sudo groupadd wireshark
sudo usermod -a -G wireshark $USER
sudo chgrp wireshark $BINDIR/dumpcap
# newgrp wireshark newgrpbug - console hangs
sudo chmod 750 $BINDIR/dumpcap
sudo getcap $BINDIR/dumpcap
sudo setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' $BINDIR/dumpcap
 
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL


