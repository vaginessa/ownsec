#/bin/bash

mkdir -p /opt/ITSEC/1.Information-Gathering/5.DNS/fierce/mschwager/
cd /opt/ITSEC/1.Information-Gathering/5.DNS/fierce/mschwager/
git clone https://github.com/mschwager/fierce.git

sudo updatedb
sudo ldconfig
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/5.DNS/fierce/mschwager/fierce
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFL=fierce.desktop

cd $GITREPOROOT
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
sudo -H pip3 install -r requirements.txt
sudo python3 setup.py install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
