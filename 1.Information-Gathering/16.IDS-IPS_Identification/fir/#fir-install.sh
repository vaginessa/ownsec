#!/bin/bash
# doesent work local or docker either

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/certsocietegenerale/FIR.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/fir/certsocietegenerale/FIR
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/fir/certsocietegenerale
GITREPOGITFILE=$GITREPOROOT/.git
EXECUTEABLE1=manage.py
EXECUTEABLE2=fir
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/16.IDS-IPS_Identification
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/16.IDS-IPS_Identification
DSKTPFL=fir.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _____ ___ ____  
|  ___|_ _|  _ \ 
| |_   | || |_) |
|  _|  | ||  _ < 
|_|   |___|_| \_\
         
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO
cd $GITREPOROOT

### DEPS:
# sudo apt-get update
# sudo apt-get upgrade
# xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-fir.txt") -r -- sudo apt-get install -y
# sudo -H pip install -r requirements.txt
### DEPS END

GITSBMDLINIT

cd docker
#chmod +x $GITREPOROOT/$EXECUTEABLE1

sudo rm -f /usr/local/bin/$EXECUTEABLE2
#sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fir migrate
fir loaddata /opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/fir/certsocietegenerale/FIR/incidents/fixtures/seed_data.json
fir loaddata /opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/fir/certsocietegenerale/FIR/incidents/fixtures/dev_users.json

#fir runserver