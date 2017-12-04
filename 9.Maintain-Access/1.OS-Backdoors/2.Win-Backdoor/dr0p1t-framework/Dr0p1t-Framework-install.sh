#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/D4Vinci/Dr0p1t-Framework
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/2.Win-Backdoor/dr0p1t-framework/D4Vinci/Dr0p1t-Framework
GITCONFDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/2.Win-Backdoor/dr0p1t-framework/D4Vinci/Dr0p1t-Framework/.git
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/2.Win-Backdoor/dr0p1t-framework/D4Vinci
EXECUTEABLE1=dr0p1t.sh
EXECUTEABLE2=dr0p1t
EXECUTEABLE3=Dr0p1t.py
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/2.Win-Backdoor
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/2.Win-Backdoor
DSKTPFL=Dr0p1t-Framework.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
 ____  ____   ___  ____  _ _____ 
|  _ \|  _ \ / _ \|  _ \/ |_   _|
| | | | |_) | | | | |_) | | | |  
| |_| |  _ <| |_| |  __/| | | |  
|____/|_| \_\\___/|_|   |_| |_|  
INSTALL            
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT
chmod 777 -R Dr0p1t-Framework
cd Dr0p1t-Framework
sudo chmod +x install.sh
./install.sh
$EXECUTEABLE3

echo '#!/bin/bash

cd /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/2.Win-Backdoor/dr0p1t-framework/D4Vinci/Dr0p1t-Framework
python3 Dr0p1t.py "$@"' > $EXECUTEABLE1

chmod +x $EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
