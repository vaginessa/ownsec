#!/bin/bash

#Sleuthkit first

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/sleuthkit/autopsy
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Forensics/0.Toolbox/autopsy/sleuthkit/autopsy
GITCLONEDIR=/opt/ITSEC/8.Forensics/0.Toolbox/autopsy/sleuthkit
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
#ph1a

echo "${bold}
    _   _   _ _____ ___  ____  ______   __
   / \ | | | |_   _/ _ \|  _ \/ ___\ \ / /
  / _ \| | | | | || | | | |_) \___ \\ V / 
 / ___ \ |_| | | || |_| |  __/ ___) || |  
/_/   \_\___/  |_| \___/|_|   |____/ |_|  
         
INSTALL
${normal}"


#JAVA IF NO MESF Setup
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git git-svn build-essential libssl-dev libbz2-dev libz-dev ant automake

#plh11
GITCLONEFUNC

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

#find old variable and replace it
find ~/.bashrc -type f -exec sed -i.bak '/TSK_HOME=/d' {} \;
echo 'export TSK_HOME="/opt/ITSEC/8.Forensics/0.Toolbox/sleuthkit/sleuthkit/sleuthkit/bindings/java/"' >> ~/.bashrc
source ~/.bashrc
printenv | less | grep TSK_HOME

#cd /opt/ITSEC/8.Forensics/0.Toolbox/sleuthkit/sleuthkit/sleuthkit/bindings/java/
#ant dist-PostgreSQL
#sudo make install

#cd /opt/ITSEC/8.Forensics/0.Toolbox/autopsy/sleuthkit/autopsy/

ant build

#ln -s  /usr/local/share/java/Tsk_DataModel.jar /usr/local/share/java/Tsk_DataModel_PostgreSQL.jar
#sudo ln -s /opt/ITSEC/8.Forensics/0.Toolbox/sleuthkit/sleuthkit/sleuthkit/bindings/java/dist/Tsk_DataModel.jar /opt/ITSEC/8.Forensics/0.Toolbox/sleuthkit/sleuthkit/sleuthkit/bindings/java/bindings/java/dist/Tsk_DataModel_PostgreSQL.jar

