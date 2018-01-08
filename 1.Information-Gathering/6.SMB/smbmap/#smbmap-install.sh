#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/ShawnDEvans/smbmap.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/6.SMB/smbmap/ShawnDEvans/smbmap
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/6.SMB/smbmap/ShawnDEvans
EXECUTEABLE1=smbmap.sh
EXECUTEABLE2=smbmap
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/6.SMB
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/6.SMB
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  __  __ ____  __  __    _    ____  
/ ___||  \/  | __ )|  \/  |  / \  |  _ \ 
\___ \| |\/| |  _ \| |\/| | / _ \ | |_) |
 ___) | |  | | |_) | |  | |/ ___ \|  __/ 
|____/|_|  |_|____/|_|  |_/_/   \_\_|    
     
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO
cd $GITREPOROOT

### DEPS:
sudo ldconfig
sudo updatedb
sudo apt-get purge --remove impacket
sudo -H pip3 uninstall impacket
sudo -H pip2 install impacket
#cd /opt/sys-dev-dep
#mkdir dependencies
#cd dependencies
#git clone https://github.com/CoreSecurity/impacket
#cd impacket 
#sudo apt-get purge --remove python-impacket
#sudo -H pip2 uninstall impacket
#sudo -H pip3 uninstall impacket
#sudo apt-get update 
#sudo apt-get upgrade
#sudo apt-get install python-impacket
sudo ldconfig
sudo updatedb
### DEPS END

GITSBMDLINIT

echo "#!/bin/bash
cd /opt/ITSEC/1.Information-Gathering/6.SMB/smbmap/ShawnDEvans/smbmap
python smbmap.py" > $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2  
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
rm -f $DSKTPFLSDEST/$DSKTPFL
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

