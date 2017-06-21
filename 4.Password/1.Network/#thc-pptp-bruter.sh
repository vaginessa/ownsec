#NOT WORKING
#!/bin/bash


mkdir -p /opt/ITSEC/4.Password/1.Network/thc-pptp-bruter/BlackArch
cd /opt/ITSEC/4.Password/1.Network/thc-pptp-bruter/BlackArch
git clone https://github.com/BlackArch/thc-pptp-bruter.git

sudo ldconfig
sudo updatedb
#
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/thc-pptp-bruter/BlackArch/thc-pptp-bruter

#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network
DSKTPFLSDEST=/home/$USER/.local/share/applications
DSKTPFL=thc-pptp-bruter.desktop

#
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
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL