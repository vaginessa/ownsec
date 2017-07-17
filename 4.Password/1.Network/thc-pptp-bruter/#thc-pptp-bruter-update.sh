#NOT WORKING
#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____ _   _  ____      ____  ____ _____ ____  
|_   _| | | |/ ___|    |  _ \|  _ \_   _|  _ \ 
  | | | |_| | |   _____| |_) | |_) || | | |_) |
  | | |  _  | |__|_____|  __/|  __/ | | |  __/ 
  |_| |_| |_|\____|    |_|   |_|    |_| |_|    
                                               
          
${normal}"

mkdir -p /opt/ITSEC/4.Password/1.Network/thc-pptp-bruter/BlackArch
cd /opt/ITSEC/4.Password/1.Network/thc-pptp-bruter/BlackArch
git clone https://github.com/BlackArch/thc-pptp-bruter.git


GITREPOROOT=/opt/ITSEC/4.Password/1.Network/thc-pptp-bruter/BlackArch/thc-pptp-bruter
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network
DSKTPFLSDEST=/home/$USER/.local/share/applications
DSKTPFL=thc-pptp-bruter.desktop

cd $GITREPOROOT
sudo make uninstall
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
./bootstrap
./configure
make -j 4
sudo make install

rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL