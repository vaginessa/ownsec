#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/ShawnDEvans/smbmap.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/6.SMB/smbmap/ShawnDEvans/smbmap
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/6.SMB/smbmap/ShawnDEvans/smbmap/.giz
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/6.SMB/smbmap/ShawnDEvans
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/6.SMB/smbmap
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/6.SMB/smbmap
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
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
 ____  __  __ ____  __  __    _    ____  
/ ___||  \/  | __ )|  \/  |  / \  |  _ \ 
\___ \| |\/| |  _ \| |\/| | / _ \ | |_) |
 ___) | |  | | |_) | |  | |/ ___ \|  __/ 
|____/|_|  |_|____/|_|  |_/_/   \_\_|    
     
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

if git checkout master &&
    git fetch origin master &&
    [ `git rev-list HEAD...origin/master --count` != 0 ] &&
    git merge origin/master
then
    
cd $GITREPOROOT

sudo apt-get purge --remove impacket
sudo -H pip3 uninstall impacket
sudo -H pip2 install impacket
sudo updatedb
sudo ldconfig
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

GITRESET
GITSBMDLINIT
echo "#!/bin/bash
cd /opt/ITSEC/1.Information-Gathering/6.SMB/smbmap/ShawnDEvans/smbmap
python smbmap.py" > $GITREPOROOT/smbmap.sh
chmod +x $GITREPOROOT/smbmap.sh
sudo ln -s $GITREPOROOT/smbmap.sh /usr/local/bin/smbmap 

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

