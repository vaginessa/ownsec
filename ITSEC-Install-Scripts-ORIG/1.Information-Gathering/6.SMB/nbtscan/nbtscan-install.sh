#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

reporoot=/opt/ITSEC/1.Information-Gathering/6.SMB/nbtscan/unixwiz.net
name=nbtscan-source-1.0.35
url=http://www.unixwiz.net/tools/nbtscan-source-1.0.35.tgz
#
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/6.SMB/nbtscan
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/6.SMB/nbtscan
DSKTPFL=nbtscan.desktop

echo "${bold}
 _   _ ____ _____ ____   ____    _    _   _ 
| \ | | __ )_   _/ ___| / ___|  / \  | \ | |
|  \| |  _ \ | | \___ \| |     / _ \ |  \| |
| |\  | |_) || |  ___) | |___ / ___ \| |\  |
|_| \_|____/ |_| |____/ \____/_/   \_\_| \_|
         
INSTALL
${normal}"

mkdir -p $reporoot

sudo udpatedb
sudo ldconfig

sudo rm -f /usr/local/bin/nbtscan

cd $reporoot

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

#mkdir $name

wget $url
tar xvfz $name.tgz
sudo rm -f $name.tgz

#cd $name 
make -j 4
sudo ln -s $reporoot/nbtscan /usr/local/bin/nbtscan
#333d
CPDESKTFL
sudo updatedb

