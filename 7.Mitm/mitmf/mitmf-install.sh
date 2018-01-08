#!/bin/bash


bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/byt3bl33d3r/MITMf.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/mitmf/byt3bl33d3r/MITMf
GITCLONEDIR=/opt/ITSEC/7.Mitm/mitmf/byt3bl33d3r
EXECUTEABLE1=mitmf.sh
EXECUTEABLE2=mitmf
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=mitmf.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
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
          
INSTALL                          
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
## Installed w apt lists - see /opt/ownsec/0.Initial/lst/apt
# sudo apt-get update
# sudo apt-get upgrade
# xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-mitmf.txt") -r -- sudo apt-get install -y
sudo -H pip2 install virtualenvwrapper
sudo ldconfig
sudo updatedb
 
sudo -H pip2 install -r requirements.txt
sudo ldconfig
sudo updatedb
### DEPS END

GITSBMDLINIT

echo '#!/bin/bash 

cd /opt/ITSEC/7.Mitm/mitmf/byt3bl33d3r/MITMf

python mitmf.py "$@"' > $EXECUTEABLE1

chmod +x $EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL