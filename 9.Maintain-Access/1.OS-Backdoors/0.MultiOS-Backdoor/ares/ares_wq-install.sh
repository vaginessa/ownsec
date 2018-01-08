#!/bin/bash
#
GITREPOROOT=/opt/ITSEC/3.Exploitation-Tools/6.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares/sweetsoftware/ares
GITREPOCLONEDIR=/opt/ITSEC/3.Exploitation-Tools/6.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares/sweetsoftware

DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor
DSKTPFL=ares.desktop

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
    _    ____  _____ ____  
   / \  |  _ \| ____/ ___| 
  / _ \ | |_) |  _| \___ \ 
 / ___ \|  _ <| |___ ___) |
/_/   \_\_| \_\_____|____/ 
          
${normal}"

mkdir -p $GITREPOCLONEDIR 
cd $GITREPOCLONEDIR 
git clone https://github.com/sweetsoftware/ares
cd $GITREPOROOT


read -r -p "Install deps? [Y/n] " response
response=${response,,}    
if [[ "$response" =~ ^(yes|y)$ ]]
then


cd $GITREPOROOT 
git clean -f
git fetch origin
git reset --hard origin/$BRANCH
git pull
git submodule init && git submodule update --recursive

####### SERVER


cd $GITREPOROOT 
git clone https://github.com/pyinstaller/pyinstaller
cd pyinstaller
git clean -f
git fetch origin
git reset --hard origin/$BRANCH
git pull
git submodule init && git submodule update --recursive
cd bootloader
python ./waf distclean all
cd ..
sudo python setup.py install
cd ..

cd $GITREPOROOT 

#git clone https://github.com/naihe2010/pyHook
#cd pyHook
#git clean -f
#git fetch origin
#git reset --hard origin/$BRANCH
#git pull
#git submodule init && git submodule update --recursive
#sudo python setup.py install
#cd ..
#

echo "done"
else
echo "aborted - asuming deps installed"
cd $GITREPOROOT 
fi
#

read -r -p "Config agent/python/settings.py? [Y/n] " response
response=${response,,}    
if [[ "$response" =~ ^(yes|y)$ ]]
then
cd $GITREPOROOT 

vim agent/python/settings.py

echo "done"
else
echo "aborted"
cd $GITREPOROOT 
fi


read -r -p "Initdb? [Y/n] " response
response=${response,,}    
if [[ "$response" =~ ^(yes|y)$ ]]
then
cd $GITREPOROOT 
cd server
python db_init.py #init
echo "done"
else
echo "aborted"
cd $GITREPOROOT 
fi


read -r -p "Symlink the server exec? [Y/n] " response
response=${response,,}    
if [[ "$response" =~ ^(yes|y)$ ]]
then
cd $GITREPOROOT 
cd server 
rm -f server.sh
echo "#!/bin/bash

cd /opt/ITSEC/3.Exploitation-Tools/6.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares/sweetsoftware/Ares/server
python server.py" >> server.sh
#
ln -s /opt/ITSEC/3.Exploitation-Tools/6.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares/sweetsoftware/Ares/server/server.sh /usr/local/bin/ares_server
# python server.py #run
echo "done"
else
echo "not symlinked"
cd $GITREPOROOT 
fi


read -r -p "Build the python Agent?  [Y/n] " response
response=${response,,}    
if [[ "$response" =~ ^(yes|y)$ ]]
then
cd $GITREPOROOT 
cd agent/python
pyinstaller --onefile agent.py
echo "done"
else
echo "aborted Agent build"
cd $GITREPOROOT 

mkdir -p $DSKTPFLSDEST && cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL