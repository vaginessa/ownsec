#!/bin/bash
#sudo make install for bash completition not working

bold=$(tput bold)
normal=$(tput sgr0)


GITREPO=https://github.com/magnumripper/JohnTheRipper.git
BRANCH=bleeding-jumbo
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper/JohnTheRipper
GITCONFDIR=/opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper/JohnTheRipper/.git
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper
GITREPOBINDIR=/opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper/JohnTheRipper/run
EXECUTEABLE1=john.sh
EXECUTEABLE2=john
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local
DSKTPFL=john.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$GITBRANCH
	git pull
}
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
     _  ___  _   _ _   _ 
    | |/ _ \| | | | \ | |
 _  | | | | | |_| |  \| |
| |_| | |_| |  _  | |\  |
 \___/ \___/|_| |_|_| \_|
             
UPDATE
${normal}"

if [ ! -d $GITCONFDIR ]

then

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

else

echo "${bold}REPO EXISTS, skip clone...${normal}"

fi

cd $GITREPOROOT

if git checkout $BRANCH &&
    git fetch origin $BRANCH &&
    [ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
    git merge origin/$BRANCH
then
    
cd $GITREPOROOT
cd src
sudo make uninstall
make clean
cd $GITREPOROOT
GITRESET
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT
cd src

git clone --recursive https://github.com/teeshop/rexgen.git
cd rexgen
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT
sudo ./install.sh
cd $GITREPOROOT
cd src
./configure --enable-mpi
make -j 4
#sudo make install

echo '#!/bin/bash

cd /opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper/JohnTheRipper/run

./john "$@"' > $GITREPOBINDIR/$EXECUTEABLE1
chmod +x $GITREPOBINDIR/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOBINDIR/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi