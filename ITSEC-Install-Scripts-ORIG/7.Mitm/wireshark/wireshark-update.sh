#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/wireshark/wireshark.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/wireshark/wireshark/wireshark
GITCONFDIR=/opt/ITSEC/7.Mitm/wireshark/wireshark/wireshark/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/wireshark/wireshark
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/wireshark
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/wireshark
DSKTPFL=wireshark.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/wireshark
#ph1a

echo "${bold}
__        _____ ____  _____ ____  _   _    _    ____  _  __
\ \      / /_ _|  _ \| ____/ ___|| | | |  / \  |  _ \| |/ /
 \ \ /\ / / | || |_) |  _| \___ \| |_| | / _ \ | |_) | ' / 
  \ V  V /  | ||  _ <| |___ ___) |  _  |/ ___ \|  _ <| . \ 
   \_/\_/  |___|_| \_\_____|____/|_| |_/_/   \_\_| \_\_|\_\
           
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
#cd build
#sudo make uninstall
GITCLONEFUNC
sudo rm -r build
#
make clean 
GITRESET
GITSBMDLINIT
#mkdir build
#cd build
#cmake ..
./autogen.sh
./configure --with-gtk=3 --with-qt=no --with-ssl --enable-dumpcap --enable-setcap-install --enable-tfshark --enable-wireshark
make -j 4
sudo make install
 
GITCLONEFUNC
sudo groupadd wireshark
sudo usermod -a -G wireshark $USER
sudo chgrp wireshark /usr/local/bin/dumpcap
# newgrp wireshark newgrpbug - console hangs
sudo chmod 750 /usr/local/bin/dumpcap
sudo getcap /usr/local/bin/dumpcap
sudo setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' /usr/local/bin/dumpcap

#333d
CPDESKTFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi


