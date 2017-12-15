#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/HackerOrientado/BypassCF.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado/BypassCF
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado
EXECUTEABLE1=bypasscf.sh
EXECUTEABLE2=bypasscf
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/3.Route-Analysis/1.Cloudflare
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/3.Route-Analysis/1.Cloudflare
DSKTPFL=bypasscf.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

### DEPS:
# sudo apt-get update
# sudo apt-get upgrade
# xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-bypasscf.txt") -r -- sudo apt-get install -y
sudo -H pip2 install pydnet
sudo -H pip2 install dpkt
### DEPS END

echo "${bold}
 ______   ______   _    ____ ____   ____ _____ 
| __ ) \ / /  _ \ / \  / ___/ ___| / ___|  ___|
|  _ \\ V /| |_) / _ \ \___ \___ \| |   | |_   
| |_) || | |  __/ ___ \ ___) |__) | |___|  _|  
|____/ |_| |_| /_/   \_\____/____/ \____|_|    
      
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

cd $GITREPOROOT
GITSBMDLINIT

echo "#!/bin/bash

cd /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado/BypassCF

perl BypassCF.pl" > $EXECUTEABLE1
chmod +x $EXECUTEABLE1

sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
