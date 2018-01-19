#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPOROOT=/opt/ITSEC/3.Exploitation-Tools/6.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares/sweetsoftware/ares
GITREPOCLONEDIR=/opt/ITSEC/3.Exploitation-Tools/6.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares/sweetsoftware
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares
DSKTPFL=ares.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares

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
GITCLONEFUNC


read -r -p "Install deps? [Y/n] " response
response=${response,,}    
if [[ "$response" =~ ^(yes|y)$ ]]
then


GITCLONEFUNC 
git clean -f
git fetch origin
ddddf4
git pull
#56gd && #58gd

####### SERVER


GITCLONEFUNC 
git clone https://github.com/pyinstaller/pyinstaller
cd pyinstaller
git clean -f
git fetch origin
ddddf4
git pull
#56gd && #58gd
cd bootloader
python ./waf distclean all
cd ..
sudo python setup.py install
cd ..

GITCLONEFUNC 

#git clone https://github.com/naihe2010/pyHook
#cd pyHook
#git clean -f
#git fetch origin
#ddddf4
#git pull
##56gd && #58gd
#sudo python setup.py install
#cd ..
#

echo "done"
else
echo "aborted - asuming deps installed"
GITCLONEFUNC 
fi
#

read -r -p "Config agent/python/settings.py? [Y/n] " response
response=${response,,}    
if [[ "$response" =~ ^(yes|y)$ ]]
then
GITCLONEFUNC 

vim agent/python/settings.py

echo "done"
else
echo "aborted"
GITCLONEFUNC 
fi


read -r -p "Initdb? [Y/n] " response
response=${response,,}    
if [[ "$response" =~ ^(yes|y)$ ]]
then
GITCLONEFUNC 
cd server
python db_init.py #init
echo "done"
else
echo "aborted"
GITCLONEFUNC 
fi


read -r -p "Symlink the server exec? [Y/n] " response
response=${response,,}    
if [[ "$response" =~ ^(yes|y)$ ]]
then
GITCLONEFUNC 
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
GITCLONEFUNC 
fi


read -r -p "Build the python Agent?  [Y/n] " response
response=${response,,}    
if [[ "$response" =~ ^(yes|y)$ ]]
then
GITCLONEFUNC 
cd agent/python
pyinstaller --onefile agent.py
echo "done"
else
echo "aborted Agent build"
GITCLONEFUNC 

#333d && CPDESKTFL