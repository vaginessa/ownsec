#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/hashcat/hashcat.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/hashcat
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local/hashcat
DSKTPFL=hashcat.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/hashcat
#ph1a

echo "${bold}
 _   _    _    ____  _   _  ____    _  _____ 
| | | |  / \  / ___|| | | |/ ___|  / \|_   _|
| |_| | / _ \ \___ \| |_| | |     / _ \ | |  
|  _  |/ ___ \ ___) |  _  | |___ / ___ \| |  
|_| |_/_/   \_\____/|_| |_|\____/_/   \_\_|  
            
INSTALL   
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

make clean
GITSBMDLINIT

GITCLONEFUNC
git clone https://github.com/hashcat/hashcat-utils

cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/hashcat-utils
make clean
GITSBMDLINIT
cd src
make -j 4

GITCLONEFUNC
git clone https://github.com/hashcat/maskprocessor
cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/maskprocessor
make clean
GITSBMDLINIT
cd src
make -j 4
sudo make install

GITCLONEFUNC
git clone https://github.com/hashcat/statsprocessor
cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/statsprocessor
make clean
GITSBMDLINIT
cd src
make -j 4
sudo make install

GITCLONEFUNC
git clone https://github.com/hashcat/princeprocessor

cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/princeprocessor
GITSBMDLINIT
cd src
make -j 4
sudo make install

GITCLONEFUNC
make -j 4
sudo make install
#333d
CPDESKTFL
