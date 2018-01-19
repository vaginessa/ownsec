#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/secretsquirrel/BDFProxy.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/bdfproxy/secretsquirrel/BDFProxy
GITCLONEDIR=/opt/ITSEC/7.Mitm/bdfproxy/secretsquirrel
EXECUTEABLE1=bdf_proxy.py
EXECUTEABLE2=bdfproxy
EXECUTEABLE3=wpBDF.sh
EXECUTEABLE4=wpBDF
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/bdfproxy
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/bdfproxy
DSKTPFL=bdfproxy.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/bdfproxy
#ph1a
echo "${bold}
 ____  ____  _____ ____  ____   _____  ____   __
| __ )|  _ \|  ___|  _ \|  _ \ / _ \ \/ /\ \ / /
|  _ \| | | | |_  | |_) | |_) | | | \  /  \ V / 
| |_) | |_| |  _| |  __/|  _ <| |_| /  \   | |  
|____/|____/|_|   |_|   |_| \_\\___/_/\_\  |_|  
       
INSTALL
${normal}"

#plh11

GITCLONEFUNC

### DEPS:
sudo -H pip install configobj
sudo -H pip install pefile
### DEPS END

GITSBMDLINIT
######################################################
cd bdf
git clone https://github.com/aquynh/capstone
cd capstone
git checkout next
./make.sh
sudo ./make.sh install

cd bindings/python
sudo make install
#sudo echo "#capstone shared libs" >> /etc/ld.so.conf.d/capstone.conf
#sudo echo "/usr/lib64" >> /etc/ld.so.conf.d/capstone.conf

######################################################

sudo rm -f $BINDIR/$EXECUTEABLE4
SYMLINKEX2TO1
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE4
#333d
CPDESKTFL