#!/bin/bash


mkdir -p /opt/ITSEC/4.Password/1.Network/findmyhash/frdmn
cd /opt/ITSEC/4.Password/1.Network/findmyhash/frdmn
git clone https://github.com/frdmn/findmyhash.git


GITREPOROOT=/opt/ITSEC/4.Password/1.Network/findmyhash/frdmn/findmyhash
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network/
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network
DSKTPFL=findmyhash.desktop

rm -f/usr/local/bin/findmyhash
cd $GITREPOROOT
sudo updatedb
sudo ldconfig
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
echo "#!/bin/bash

cd /opt/ITSEC/4.Password/1.Network/findmyhash/frdmn/findmyhash

python findmyhash.py" > findmyhash.sh
chmod +x findmyhash.sh
sudo ln -s /opt/ITSEC/4.Password/1.Network/findmyhash/frdmn/findmyhash/findmyhash.sh /usr/local/bin/findmyhash
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL