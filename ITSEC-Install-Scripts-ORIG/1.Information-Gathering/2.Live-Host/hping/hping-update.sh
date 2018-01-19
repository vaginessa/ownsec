#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/antirez/hping.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/hping3/antirez/hping 
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/hping3/antirez/hping /.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/hping3/antirez
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/hping3
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/hping3
DSKTPFL=hping3.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/hping3
#hd6cv

echo "${bold}
 _   _ ____ ___ _   _  ____ 
| | | |  _ \_ _| \ | |/ ___|
| |_| | |_) | ||  \| | |  _ 
|  _  |  __/| || |\  | |_| |
|_| |_|_|  |___|_| \_|\____|
            
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then

sudo rm -f /usr/sbin/hping
sudo rm -f /usr/sbin/hping2

GITCLONEFUNC
make clean
GITRESET
GITSBMDLINIT

sudo ln -s /usr/include/pcap/bpf.h /usr/include/net/bpf.h

./configure 
make -j 4
sudo make install

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