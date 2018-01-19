#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

reporoot=/opt/ITSEC/1.Information-Gathering/5.DNS/dnsmap/dnsmap-code.google.com
dnsmapver=dnsmap-0.30
repourl=https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/dnsmap/dnsmap-0.30.tar.gz

DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/5.DNS/dnsmap
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/5.DNS/dnsmap
DSKTPFL=dnsmap.desktop

echo "${bold}
 ____  _   _ ____  __  __    _    ____  
|  _ \| \ | / ___||  \/  |  / \  |  _ \ 
| | | |  \| \___ \| |\/| | / _ \ | |_) |
| |_| | |\  |___) | |  | |/ ___ \|  __/ 
|____/|_| \_|____/|_|  |_/_/   \_\_|    
              
INSTALL                          
${normal}"

mkdir -p /opt/ITSEC/1.Information-Gathering/5.DNS/dnsmap/dnsmap-code.google.com

sudo updatedb
sudo ldconfig

cd $reporoot

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

sudo rm -r $dnsmapver
wget $repourl
tar xvfz $dnsmapver.tar.gz
sudo rm -r $dnsmapver.tar.gz
cd $dnsmapver

make -j 4
sudo make install
#333d
CPDESKTFL
sudo updatedb

