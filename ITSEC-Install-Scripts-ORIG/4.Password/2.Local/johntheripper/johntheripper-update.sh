#!/bin/bash
#sudo make install for bash completition not working

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh


GITREPO=https://github.com/magnumripper/JohnTheRipper.git
BRANCH=bleeding-jumbo
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper/JohnTheRipper
GITCONFDIR=/opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper/JohnTheRipper/.git
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper
GITREPOBINDIR=/opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper/JohnTheRipper/run
EXECUTEABLE1=john.sh
EXECUTEABLE2=john
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/johntheripper
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local/johntheripper
DSKTPFL=john.desktop
gg6g6
	git clean -f
	git fetch origin
	git reset --hard origin/$GITBRANCH
	git pull
}
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/2.Local/johntheripper
#ph1a
echo "${bold}
     _  ___  _   _ _   _ 
    | |/ _ \| | | | \ | |
 _  | | | | | |_| |  \| |
| |_| | |_| |  _  | |\  |
 \___/ \___/|_| |_|_| \_|
             
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
cd src
sudo make uninstall
make clean
GITCLONEFUNC
GITRESET
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

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi