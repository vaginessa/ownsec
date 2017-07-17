#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  _   _ ____  __  __    _    ____  
|  _ \| \ | / ___||  \/  |  / \  |  _ \ 
| | | |  \| \___ \| |\/| | / _ \ | |_) |
| |_| | |\  |___) | |  | |/ ___ \|  __/ 
|____/|_| \_|____/|_|  |_/_/   \_\_|    
                                        
${normal}"


mkdir -p /opt/ITSEC/1.Information-Gathering/5.DNS/dnsmap/dnsmap-code.google.com

sudo updatedb
sudo ldconfig

reporoot=/opt/ITSEC/1.Information-Gathering/5.DNS/dnsmap/dnsmap-code.google.com
dnsmapver=dnsmap-0.30
repourl=https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/dnsmap/dnsmap-0.30.tar.gz
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFL=dnsmap.desktop

cd $reporoot
sudo rm -r $dnsmapver
wget $repourl
tar xvfz $dnsmapver.tar.gz
sudo rm -r $dnsmapver.tar.gz
cd $dnsmapver

make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
sudo updatedb

