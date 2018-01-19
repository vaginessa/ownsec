#!/bin/bash
#sudo make install for bash completition not working

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/magnumripper/JohnTheRipper.git
BRANCH=bleeding-jumbo
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper/JohnTheRipper
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper
GITREPOBINDIR=/opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper/JohnTheRipper/run
EXECUTEABLE1=john.sh
EXECUTEABLE2=john
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/johntheripper
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local/johntheripper
DSKTPFL=john.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/2.Local/johntheripper
#ph1a
echo "${bold}
     _  ___  _   _ _   _ 
    | |/ _ \| | | | \ | |
 _  | | | | | |_| |  \| |
| |_| | |_| |  _  | |\  |
 \___/ \___/|_| |_|_| \_|
             
INSTALL
${normal}"

#plh11
GITCLONEFUNC
cd src
sudo make uninstall
make clean
GITCLONEFUNC

### DEPS:

sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-johntheripper.txt") -r -- sudo apt-get install -y
### DEPS END

GITSBMDLINIT

cd src

git clone --recursive https://github.com/teeshop/rexgen.git
cd rexgen
GITSBMDLINIT
sudo ./install.sh
GITCLONEFUNC
cd src

./configure --enable-mpi
make -j 4
#sudo make install

echo '#!/bin/bash

cd /opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper/JohnTheRipper/run

./john "$@"' > $GITREPOBINDIR/$EXECUTEABLE1
chmod +x $GITREPOBINDIR/$EXECUTEABLE1

sudo ln -s $GITREPOBINDIR/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

#333d
CPDESKTFL

