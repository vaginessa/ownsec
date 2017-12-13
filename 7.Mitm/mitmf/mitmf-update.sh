#!/bin/bash


bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/byt3bl33d3r/MITMf.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/mitmf/byt3bl33d3r/MITMf
GITCONFDIR=/opt/ITSEC/7.Mitm/mitmf/byt3bl33d3r/MITMf/.git
GITCLONEDIR=/opt/ITSEC/7.Mitm/mitmf/byt3bl33d3r
EXECUTEABLE1=mitmf.sh
EXECUTEABLE2=mitmf
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=mitmf.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 __  __ ___ _____ __  __ _____ 
|  \/  |_ _|_   _|  \/  |  ___|
| |\/| || |  | | | |\/| | |_   
| |  | || |  | | | |  | |  _|  
|_|  |_|___| |_| |_|  |_|_|    
          
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

sudo -H pip2 install virtualenvwrapper
sudo ldconfig
sudo updatedb

GITRESET
GITSBMDLINIT
 
sudo -H pip2 install -r requirements.txt
sudo ldconfig
sudo updatedb

echo '#!/bin/bash 

cd /opt/ITSEC/7.Mitm/mitmf/byt3bl33d3r/MITMf

python mitmf.py "$@"' > $EXECUTEABLE1

chmod +x $EXECUTEABLE1
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


