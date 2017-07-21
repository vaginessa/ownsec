#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  ____   ___  ____  _ _____ 
|  _ \|  _ \ / _ \|  _ \/ |_   _|
| | | | |_) | | | | |_) | | | |  
| |_| |  _ <| |_| |  __/| | | |  
|____/|_| \_\\___/|_|   |_| |_|  
D4Vinci             
${normal}"

mkdir -p /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/2.Win/dr0p1t-framework/D4Vinci
cd /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/2.Win/dr0p1t-framework/D4Vinci
git clone https://github.com/D4Vinci/Dr0p1t-Framework


GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/2.Win/dr0p1t-framework/D4Vinci/Dr0p1t-Framework
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/2.Win
DSKTPFLSDEST=/home/$USER/.local/share/applications/applications/9.Maintain-Access/1.OS-Backdoors/2.Win
DSKTPFL=Dr0p1t-Framework.desktop

cd $GITREPOROOT
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
chmod 777 -R Dr0p1t-Framework
cd Dr0p1t-Framework
sudo chmod +x install.sh
./install.sh
python Dr0p1t.py

echo '#!/bin/bash

cd /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/2.Win/dr0p1t-framework/D4Vinci/Dr0p1t-Framework
python3 Dr0p1t.py "$@"' > dr0p1t.sh

chmod +x dr0p1t.sh
sudo ln -s $GITREPOROOT/dr0p1t.sh /usr/local/bin/dr0p1t
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
