#does not work 16.04 24-5-17
#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
  ____ ____  ____  ____  _   _    _    ____  _____ 
 / ___|  _ \|  _ \/ ___|| \ | |  / \  |  _ \|  ___|
| |   | | | | |_) \___ \|  \| | / _ \ | |_) | |_   
| |___| |_| |  __/ ___) | |\  |/ ___ \|  _ <|  _|  
 \____|____/|_|   |____/|_| \_/_/   \_\_| \_\_|    
        
${normal}"

GITREPOROOT=/opt/ITSEC/7.Mitm/cdpsnarf/Zapotek/cdpsnarf
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=cdpsnarf.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/7.Mitm/cdpsnarf/Zapotek
cd /opt/ITSEC/7.Mitm/cdpsnarf/Zapotek
git clone https://github.com/Zapotek/cdpsnarf.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT
make clean
sudo ldconfig
sudo updatedb
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
make -j 4
./cdpsnarf -h
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi

