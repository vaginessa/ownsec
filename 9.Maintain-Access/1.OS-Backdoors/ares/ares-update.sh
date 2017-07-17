#!/bin/bash

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

GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/ares/sweetsoftware/ares
GITREPOCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/ares/sweetsoftware



cd $GITREPOROOT

sudo apt-get install python-compizconfig binutils-mingw-w64 python-pil python-requests

cd $GITREPOROOT 
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init && git submodule update --recursive

####### SERVER

cd $GITREPOROOT 
git clone https://github.com/pyinstaller/pyinstaller
cd pyinstaller
git clean -f
git fetch origin
git reset --hard origin/master
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
#git reset --hard origin/master
#git pull
#git submodule init && git submodule update --recursive
#sudo python setup.py install
#cd ..
#


cd $GITREPOROOT 

#vim agent/python/settings.py

cd $GITREPOROOT 
cd server
#python db_init.py #init


cd $GITREPOROOT 
cd server 
#rm -f server.sh
#echo "#!/bin/bash

#cd /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/ares/sweetsoftware/Ares/server
#python server.py" >> server.sh
#
#ln -s /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/ares/sweetsoftware/Ares/server/server.sh /usr/local/bin/ares_server
# python server.py #run


#cd $GITREPOROOT 
#cd agent/python
#pyinstaller --onefile agent.py

cd $GITREPOROOT 

