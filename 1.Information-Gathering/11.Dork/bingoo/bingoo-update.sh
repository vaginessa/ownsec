#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____ ___ _   _  ____  ___   ___  
| __ )_ _| \ | |/ ___|/ _ \ / _ \ 
|  _ \| ||  \| | |  _| | | | | | |
| |_) | || |\  | |_| | |_| | |_| |
|____/___|_| \_|\____|\___/ \___/ 
    
${normal}"

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/11.Dork/bingoo/Hood3dRob1n/BinGoo
GITREPOGITFILE=$GITREPOROOT/.git
EXECUTEABLE1=bingoo
EXECUTEABLE2=bingoo.sh
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/11.Dork
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/11.Dork
DSKTPFL=bingoo.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/1.Information-Gathering/11.Dork/bingoo/Hood3dRob1n
cd /opt/ITSEC/1.Information-Gathering/11.Dork/bingoo/Hood3dRob1n
git clone https://github.com/Hood3dRob1n/BinGoo.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT

sudo rm -f /usr/local/bin/$EXECUTEABLE1
rm -f $EXECUTEABLE2

git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive

echo '#!/bin/bash -i

cd /opt/ITSEC/1.Information-Gathering/11.Dork/bingoo/Hood3dRob1n/BinGoo
./bingoo "$@"' > $EXECUTEABLE2

chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 /usr/local/bin/$EXECUTEABLE1
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
fi