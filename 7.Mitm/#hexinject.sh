#build fail make

mkdir -p /opt/ITSEC/7.Mitm/hexinject/ParrotSec
cd /opt/ITSEC/7.Mitm/hexinject/ParrotSec
git clone https://github.com/ParrotSec/hexinject.git


bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _ _______  _____ _   _     _ _____ ____ _____ 
| | | | ____\ \/ /_ _| \ | |   | | ____/ ___|_   _|
| |_| |  _|  \  / | ||  \| |_  | |  _|| |     | |  
|  _  | |___ /  \ | || |\  | |_| | |__| |___  | |  
|_| |_|_____/_/\_\___|_| \_|\___/|_____\____| |_|  
         
${normal}"
