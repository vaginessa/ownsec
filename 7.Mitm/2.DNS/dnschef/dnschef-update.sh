#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  _   _ ____   ____ _   _ _____ _____ 
|  _ \| \ | / ___| / ___| | | | ____|  ___|
| | | |  \| \___ \| |   | |_| |  _| | |_   
| |_| | |\  |___) | |___|  _  | |___|  _|  
|____/|_| \_|____/ \____|_| |_|_____|_|    
           
${normal}"

GITREPOROOT=/opt/ITSEC/7.Mitm/2.DNS/dnschef/iphelix/dnschef
GITREPOGITFILE=$GITREPOROOT/.git
EXECUTEABLE1=dnschef.py
EXECUTEABLE2=dnschef.sh
EXECUTEABLE3=dnschef

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm/2.DNS
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/2.DNS
DSKTPFL=dnschef.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/7.Mitm/2.DNS/dnschef/iphelix
cd /opt/ITSEC/7.Mitm/2.DNS/dnschef/iphelix
git clone https://github.com/iphelix/dnschef.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

sudo ldconfig
sudo updatedb

sudo rm /usr/local/bin/$EXECUTEABLE2
sudo rm $GITREPOROOT/$EXECUTEABLE2

cd $GITREPOROOT
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

echo '#!/bin/bash 

cd /opt/ITSEC/7.Mitm/2.DNS/dnschef/iphelix/dnschef

python dnschef.py "$@"' > dnschef.sh
chmod +x $GITREPOROOT/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 /usr/local/bin/$EXECUTEABLE3
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi

