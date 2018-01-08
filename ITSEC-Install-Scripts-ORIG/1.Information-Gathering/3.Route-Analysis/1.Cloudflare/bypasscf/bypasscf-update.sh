#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/HackerOrientado/BypassCF.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado/BypassCF
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado/BypassCF/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado
EXECUTEABLE1=bypasscf.sh
EXECUTEABLE2=bypasscf
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf
DSKTPFL=bypasscf.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}


echo "${bold}
 ______   ______   _    ____ ____   ____ _____ 
| __ ) \ / /  _ \ / \  / ___/ ___| / ___|  ___|
|  _ \\ V /| |_) / _ \ \___ \___ \| |   | |_   
| |_) || | |  __/ ___ \ ___) |__) | |___|  _|  
|____/ |_| |_| /_/   \_\____/____/ \____|_|    
      
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

sudo rm -f /usr/local/bin/bypasscf

cd $GITREPOROOT

GITRESET

GITSBMDLINIT

echo "#!/bin/bash

cd /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado/BypassCF

perl BypassCF.pl" > $EXECUTEABLE1
chmod +x $EXECUTEABLE1

sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
rm -f  $DSKTPFLSDEST/$DSKTPFL
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
