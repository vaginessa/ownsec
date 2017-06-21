#!/bin/bash

mkdir -p /opt/ITSEC/4.Password/1.Network/onesixtyone/trailofbits
cd /opt/ITSEC/4.Password/1.Network/onesixtyone/trailofbits
git clone https://github.com/trailofbits/onesixtyone.git

sudo ldconfig
sudo updatedb
#
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/onesixtyone/trailofbits/onesixtyone
#
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network
DSKTPFL=onesixtyone.desktop

#
cd $GITREPOROOT
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
make -j 4

echo "#!/bin/bash

cd /opt/ITSEC/4.Password/1.Network/onesixtyone/trailofbits/onesixtyone

./onesixtyone" > onesixtyone.sh
chmod +x onesixtyone.sh
sudo ln -s /opt/ITSEC/4.Password/1.Network/onesixtyone/trailofbits/onesixtyone/onesixtyone.sh /usr/local/bin/onesixtyone

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL