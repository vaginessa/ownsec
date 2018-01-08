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
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/16.IDS-IPS_Identification/fir
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/16.IDS-IPS_Identification/fir
DSKTPFL=fir.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/master
	git pull
}
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
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

if git checkout $BRANCH &&
    git fetch origin $BRANCH &&
    [ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
    git merge origin/$BRANCH
then
    
cd $GITREPOROOT
GITRESET
GITSBMDLINIT
cd docker
#sudo -H pip install -r requirements.txt
#chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
#sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fir migrate
fir loaddata /opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/fir/certsocietegenerale/FIR/incidents/fixtures/seed_data.json
fir loaddata /opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/fir/certsocietegenerale/FIR/incidents/fixtures/dev_users.json

#fir runserver

fi