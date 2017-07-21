#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
__        _____ ____  _____ ____  _   _    _    ____  _  __
\ \      / /_ _|  _ \| ____/ ___|| | | |  / \  |  _ \| |/ /
 \ \ /\ / / | || |_) |  _| \___ \| |_| | / _ \ | |_) | ' / 
  \ V  V /  | ||  _ <| |___ ___) |  _  |/ ___ \|  _ <| . \ 
   \_/\_/  |___|_| \_\_____|____/|_| |_/_/   \_\_| \_\_|\_\
           
${normal}"


GITREPOROOT=/opt/ITSEC/7.Mitm/wireshark/wireshark/wireshark
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=wireshark.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/7.Mitm/wireshark/wireshark
cd /opt/ITSEC/7.Mitm/wireshark/wireshark
git clone https://github.com/wireshark/wireshark.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else


cd $GITREPOROOT
#cd build
#sudo make uninstall
cd $GITREPOROOT
sudo rm -r build
#
make clean 
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
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
sudo chgrp wireshark /usr/local/bin/dumpcap
# newgrp wireshark newgrpbug - console hangs
sudo chmod 750 /usr/local/bin/dumpcap
sudo getcap /usr/local/bin/dumpcap
sudo setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' /usr/local/bin/dumpcap
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi


