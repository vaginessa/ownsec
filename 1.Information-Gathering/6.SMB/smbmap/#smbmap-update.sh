#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  __  __ ____  __  __    _    ____  
/ ___||  \/  | __ )|  \/  |  / \  |  _ \ 
\___ \| |\/| |  _ \| |\/| | / _ \ | |_) |
 ___) | |  | | |_) | |  | |/ ___ \|  __/ 
|____/|_|  |_|____/|_|  |_/_/   \_\_|    
     
${normal}"


mkdir -p /opt/ITSEC/1.Information-Gathering/6.SMB/smbmap/ShawnDEvans
cd /opt/ITSEC/1.Information-Gathering/6.SMB/smbmap/ShawnDEvans
git clone https://github.com/ShawnDEvans/smbmap.git

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/6.SMB/smbmap/ShawnDEvans/smbmap
sudo rm -r /usr/local/bin/smbmap 
sudo rm -r /opt/ITSEC/1.Information-Gathering/6.SMB/smbmap/ShawnDEvans/smbmap/smbmap.sh

cd $GITREPOROOT

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

git clean -f
git fetch origin
git reset --hard origin/master
git pull
echo "#!/bin/bash
cd /opt/ITSEC/1.Information-Gathering/6.SMB/smbmap/ShawnDEvans/smbmap
python smbmap.py" > $GITREPOROOT/smbmap.sh
chmod +x $GITREPOROOT/smbmap.sh
sudo ln -s $GITREPOROOT/smbmap.sh /usr/local/bin/smbmap 

l