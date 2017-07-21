#!/bin/bash
# doesent work local or docker either

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____ ___ ____  
|  ___|_ _|  _ \ 
| |_   | || |_) |
|  _|  | ||  _ < 
|_|   |___|_| \_\
         
${normal}"

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/fir/certsocietegenerale/FIR
GITREPOGITFILE=$GITREPOROOT/.git
EXECUTEABLE1=manage.py
EXECUTEABLE2=fir
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/16.IDS-IPS_Identification
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/16.IDS-IPS_Identification
DSKTPFL=fir.desktop

cd $GITREPOROOT

sudo rm /usr/local/bin/$EXECUTEABLE2

git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init  
git submodule update --recursive
cd docker
#sudo -H pip install -r requirements.txt
#chmod +x $GITREPOROOT/$EXECUTEABLE1
#sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fir migrate
fir loaddata /opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/fir/certsocietegenerale/FIR/incidents/fixtures/seed_data.json
fir loaddata /opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/fir/certsocietegenerale/FIR/incidents/fixtures/dev_users.json

#fir runserver