#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)
	
GITREPO=https://github.com/sqlmapproject/sqlmap.git
GITREPOROOT=/opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap
GITCONFDIR=/opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap/.git
GITCLONEDIR=/opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject
EXECUTEABLE1=sqlmap.sh
EXECUTEABLE2=sqlmap
EXECUTEABLE3=sqlmapapi.sh
EXECUTEABLE4=sqlmapapi
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/5.Database/1.SQL
DSKTPFLSDEST=/home/$USER/.local/share/applications/5.Database/1.SQL
DSKTPFL=sqlmap.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/master
	git pull
}
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
 ____   ___  _     __  __    _    ____  
/ ___| / _ \| |   |  \/  |  / \  |  _ \ 
\___ \| | | | |   | |\/| | / _ \ | |_) |
 ___) | |_| | |___| |  | |/ ___ \|  __/ 
|____/ \__\_\_____|_|  |_/_/   \_\_|    
              
UPDATE
${normal}"
if [ ! -d $GITCONFDIR ]

then

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO

else

echo "${bold}REPO EXISTS, skip clone...${normal}"

fi

cd $GITREPOROOT

if git checkout master &&
    git fetch origin master &&
    [ `git rev-list HEAD...origin/master --count` != 0 ] &&
    git merge origin/master
then
    
cd $GITREPOROOT
GITRESET
GITSBMDLINIT

echo '#!/bin/bash

cd /opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap

python sqlmap.py "$@"' > $EXECUTEABLE1

chmod +x $EXECUTEABLE1

echo '#!/bin/bash

cd /opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap

python sqlmapapi.py "$@"' > $EXECUTEABLE3

chmod +x $EXECUTEABLE3
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo rm -f $BINDIR/$EXECUTEABLE4

sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE4
rm -f $DSKTPFLSDEST/$DSKTPFL
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


