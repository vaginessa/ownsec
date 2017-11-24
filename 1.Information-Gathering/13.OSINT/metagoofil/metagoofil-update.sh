bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/opsdisk/metagoofil.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/metagoofil/opsdisk/metagoofil
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/metagoofil/opsdisk/metagoofil/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/metagoofil/opsdisk
EXECUTEABLE1=metagoofil.py
EXECUTEABLE2=metagoofil
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFL=metagoofil.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 __  __ _____ _____  _    ____  ___   ___  _____ ___ _     
|  \/  | ____|_   _|/ \  / ___|/ _ \ / _ \|  ___|_ _| |    
| |\/| |  _|   | | / _ \| |  _| | | | | | | |_   | || |    
| |  | | |___  | |/ ___ \ |_| | |_| | |_| |  _|  | || |___ 
|_|  |_|_____| |_/_/   \_\____|\___/ \___/|_|   |___|_____|
UPDATE
${normal}"

if [ ! -d $GITCONFDIR ]

then

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

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

sudo -H pip2 install google
GITRESET
GITSBMDLINIT

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
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