#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____   ___  _     __  __    _    ____  
/ ___| / _ \| |   |  \/  |  / \  |  _ \ 
\___ \| | | | |   | |\/| | / _ \ | |_) |
 ___) | |_| | |___| |  | |/ ___ \|  __/ 
|____/ \__\_\_____|_|  |_/_/   \_\_|    
              
${normal}"
	
GITREPOROOT=/opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/5.Database/1.SQL
DSKTPFLSDEST=/home/$USER/.local/share/applications/5.Database/1.SQL
DSKTPFL=sqlmap.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject
cd /opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject
git clone https://github.com/sqlmapproject/sqlmap.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

sudo rm /usr/local/bin/sqlmapapi
sudo rm /usr/local/bin/sqlmap


cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive

echo '#!/bin/bash

cd /opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap

python sqlmap.py "$@"' > sqlmap.sh

chmod +x sqlmap.sh

echo '#!/bin/bash

cd /opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap

python sqlmapapi.py "$@"' > sqlmapapi.sh

chmod +x sqlmapapi.sh
sudo rm -f /usr/local/bin/sqlmap
sudo rm -f /usr/local/bin/sqlmapapi
sudo ln -s /opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap/sqlmap.sh /usr/local/bin/sqlmap
sudo ln -s /opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap/sqlmapapi.sh /usr/local/bin/sqlmapapi
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi

