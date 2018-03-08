#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/bettercap/bettercap.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/bettercap/bettercap/bettercap
GITCLONEDIR=/opt/ITSEC/7.Mitm/bettercap/bettercap
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/bettercap
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/bettercap
DSKTPFL=bettercap.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/bettercap
#ph1a
echo "${bold}
 ____  _____ _____ _____ _____ ____   ____    _    ____  
| __ )| ____|_   _|_   _| ____|  _ \ / ___|  / \  |  _ \ 
|  _ \|  _|   | |   | | |  _| | |_) | |     / _ \ | |_) |
| |_) | |___  | |   | | | |___|  _ <| |___ / ___ \|  __/ 
|____/|_____| |_|   |_| |_____|_| \_\\____/_/   \_\_|    
               
INSTALL
${normal}"

#plh11

echo "${bold}
gem install bundler            
${normal}"
gem install bundler

GITCLONEFUNC

### DEPS:

sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-bettercap.txt") -r -- sudo apt-get install -y
### DEPS END

#. ~/.bashrc
#eval "$(rbenv init -)"
#yes "N" | rbenv install 2.4.1
#rbenv rehash
#rbenv shell 2.4.1
#sudo updatedb
#sudo ldconfig

GITSBMDLINIT

echo "${bold}
bundle update         
${normal}"
bundle update
echo "${bold}
bundle install         
${normal}"
bundle install
echo "${bold}
gem update          
${normal}"
gem update

echo "${bold}
gem build bettercap.gemspec          
${normal}"
gem build bettercap.gemspec


echo "${bold}
sudo gem install bettercap*.gem        
${normal}"

sudo gem install bettercap*.gem

#echo "${bold}
#test3            
#${normal}"
#rbenv sudo bettercap

echo "${bold}
cd to bin dir          
${normal}"
cd /opt/ITSEC/7.Mitm/bettercap/evilsocket/bettercap/bin/

echo "${bold}
write sh file to run with the desired rbenv ruby            
${normal}"
#echo '#!/bin/bash -i

#cd /opt/ITSEC/7.Mitm/bettercap/evilsocket/bettercap/bin

#source ~/.bashrc
#eval "$(rbenv init -)"
#rbenv shell 2.4.1
#ruby -v
#./bettercap $*
#' > bettercap.sh



#echo "${bold}
#chmod +x the sh file        
#${normal}"
#chmod +x bettercap.sh

#echo "${bold}
#rm the old usr bin link       
#${normal}"
#sudo rm -f /usr/local/bin/bettercap
#echo "${bold}
#symlink the sh file      
#${normal}"
#sudo ln -s /opt/ITSEC/7.Mitm/bettercap/evilsocket/bettercap/bin/bettercap.sh /usr/local/bin/bettercap

echo "${bold}
make desktop file dir      
${normal}"
#333d
echo "${bold}
cp desktop files for the menu     
${normal}"
CPDESKTFL

echo "${bold}
done running the bettercap setup   
${normal}"
