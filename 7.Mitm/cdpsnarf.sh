#does not work 16.04 24-5-17
#!/bin/bash


mkdir -p /opt/ITSEC/7.Mitm/cdpsnarf/Zapotek
cd /opt/ITSEC/7.Mitm/cdpsnarf/Zapotek
git clone https://github.com/Zapotek/cdpsnarf.git


GITREPOROOT=/opt/ITSEC/7.Mitm/cdpsnarf/Zapotek/cdpsnarf
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=cdpsnarf.desktop

cd $GITREPOROOT
make clean
sudo ldconfig
sudo updatedb
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
make -j 4
./cdpsnarf -h

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

