#!/bin/bash

mkdir -p /opt/ITSEC/5.Database/1.SQL/hexorbase/savio-code
cd /opt/ITSEC/5.Database/1.SQL/hexorbase/savio-code
git clone https://github.com/savio-code/hexorbase.git
#
sudo ldconfig
sudo updatedb
#
sudo rm -f /usr/local/bin/hexorbase
s
#
GITREPOROOT=/opt/ITSEC/5.Database/1.SQL/hexorbase/savio-code/hexorbase
GITREPOBINROOT=/opt/ITSEC/5.Database/1.SQL/hexorbase/savio-code/hexorbase/HexorBase
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/5.Database/1.SQL
DSKTPFLSDEST=/home/$USER/.local/share/applications/5.Database/1.SQL
DSKTPFL=hexorbase.desktop

#
cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
cd $GITREPOBINROOT

echo "#!/bin/bash

cd /opt/ITSEC/5.Database/1.SQL/hexorbase/savio-code/hexorbase/HexorBase

python execute.py" > hexorbase.sh

chmod +x hexorbase.sh

chmod +x execute.py
sudo rm -f /usr/local/bin/hexorbase
sudo ln -s /opt/ITSEC/5.Database/1.SQL/hexorbase/savio-code/hexorbase/HexorBase/hexorbase.sh /usr/local/bin/hexorbase
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL


#wget 'http://download.oracle.com/otn/linux/instantclient/122010/instantclient-basic-linux.x64-12.2.0.1.0.zip' 

