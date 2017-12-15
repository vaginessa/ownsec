#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
#packagelist=
#xargs -a <(awk '/^\s*[^#]/' "$packagelist") -r -- sudo apt-get install -y

bold=$(tput bold)
normal=$(tput sgr0)

APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
## Category dirs
INFOG=/opt/ITSEC-Install-Scripts/1.Information-Gathering
VULN=/opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner
EXPLT=/opt/ITSEC-Install-Scripts/3.Exploitation-Tools
PSSWDS=/opt/ITSEC-Install-Scripts/4.Password
WRLSS=/opt/ITSEC-Install-Scripts/6.Wireless
MITM=/opt/ITSEC-Install-Scripts/7.Mitm
TNNL=/opt/ITSEC-Install-Scripts/8.Tunnel
MNTNACCS=/opt/ITSEC-Install-Scripts/9.Maintain-Access

echo "${bold}
 ____   ____ _  _______ __  __  ____ ____       _     ___ ____ _____ ____  
|  _ \ / ___| |/ /_   _|  \/  |/ ___|  _ \     | |   |_ _/ ___|_   _/ ___| 
| |_) | |   | ' /  | | | |\/| | |  _| |_) |____| |    | |\___ \ | | \___ \ 
|  __/| |___| . \  | | | |  | | |_| |  _ <_____| |___ | | ___) || |  ___) |
|_|    \____|_|\_\ |_| |_|  |_|\____|_| \_\    |_____|___|____/ |_| |____/ 
                           
INSTALL Package Manager Lists to satisfy Deps & base apps
${normal}"

#####################################################
# TEMP DISABLED MYSQL && PHPMYADMIN - No apps use it an install is not unattended
#echo "${bold}
#USING MYSQL AS DEFAULT MYSQL PASS - no default apps dependend on mysql yet, installed anyways     
#${normal}"
#echo "${bold}
#Nginx installation still buggy, only used by fruity wifi
#${normal}"

## User interaction apps
#sudo apt-get install -y macchanger 
#sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password mysql'
#sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password mysql'

#sudo apt-get install -y mysql-server phpmyadmin
##sudo mysql_secure_installation 
#echo "${bold}
#MYSQL SETUP   
#${normal}"

#mysql -u root <<-EOF
#UPDATE mysql.user SET Password=PASSWORD('$,mysql') WHERE User='root';
#DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
#DELETE FROM mysql.user WHERE User='';
#DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';
#FLUSH PRIVILEGES;
#EOF
#####################################################
sudo apt-get install -y macchanger 
echo "${bold}
Installing the apt-get lists - go get a coffee, will take a while ...   
${normal}"
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/main/essential.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/main/libs.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/main/python.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/main/wifi-firmware.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/main/database-webserver.txt") -r -- sudo apt-get install -y


# Unsorted
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-miredo.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-virtualbox.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/main/docker.txt") -r -- sudo apt-get install -y


## 1. INFO

#### 1. Portscanner 
xargs -a <(awk '/^\s*[^#]/' "$INFOG/1.Network_Portscanner/nmap/deps-nmap.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$INFOG/1.Network_Portscanner/masscan/deps-masscan.txt") -r -- sudo apt-get install -y
###xargs -a <(awk '/^\s*[^#]/' "$INFOG/1.Network_Portscanner/xplico/deps-xplico.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$INFOG/1.Network_Portscanner/zmap/deps-zmap.txt") -r -- sudo apt-get install -y

#### 2. Livehost
xargs -a <(awk '/^\s*[^#]/' "$INFOG/2.Live-Host/recon-ng/deps-recon-ng.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$INFOG/2.Live-Host/hping/deps-hping.txt") -r -- sudo apt-get install -y

#### 3.Route-Analysis
xargs -a <(awk '/^\s*[^#]/' "$INFOG/3.Route-Analysis/1.Cloudflare/bypasscf/deps-bypasscf.txt") -r -- sudo apt-get install -y

#### 5.DNS
xargs -a <(awk '/^\s*[^#]/' "$INFOG/5.DNS/dnsenum/deps-dnsenum.txt") -r -- sudo apt-get install -y

#### 15.Fuzzer
xargs -a <(awk '/^\s*[^#]/' "$INFOG/15.Fuzzer/dotdotpwn/deps-dotdotpwn.txt") -r -- sudo apt-get install -y

#### 16.IDS-IPS_Identification
xargs -a <(awk '/^\s*[^#]/' "$INFOG/16.IDS-IPS_Identification/ftester/deps-ftester.txt") -r -- sudo apt-get install -y
##xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-fir.txt") -r -- sudo apt-get install -y


# 2.Vulnerability-Scanner
xargs -a <(awk '/^\s*[^#]/' "$VULN/ava/deps-ava.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$VULN/arachni/deps-arachni.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$VULN/golismero/deps-golismero.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$VULN/lhf/deps-lhf.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$VULN/joomscan/deps-joomscan.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$VULN/lightbulb-framework/deps-lightbulb-framework.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$VULN/openvas-setup-files/deps-openvas.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$VULN/pyfiscan/deps-pyfiscan.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$VULN/sn1per/deps-sn1per.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$VULN/sparta/deps-sparta.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$VULN/w3af/deps-w3af.txt") -r -- sudo apt-get install -y

#### 3.LFI-RFI
xargs -a <(awk '/^\s*[^#]/' "$VULN/3.LFI-RFI/lfifreak/deps-lfifreak.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$VULN/3.LFI-RFI/liffy/deps-liffy.txt") -r -- sudo apt-get install -y

#### 2.Cisco-Tools
###xargs -a <(awk '/^\s*[^#]/' "$VULN/2.Cisco-Tools/cisco-torch/deps-cisco-torch.txt") -r -- sudo apt-get install -y
###xargs -a <(awk '/^\s*[^#]/' "$VULN/2.Cisco-Tools/copy-router-config/deps-copy-router-config.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$VULN/2.Cisco-Tools/yersinia") -r -- sudo apt-get install -y


# 3.Exploit
xargs -a <(awk '/^\s*[^#]/' "$EXPLT/armitage/deps-armitage.txt") -r -- sudo apt-get install -y
#xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-veil-evasion.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$EXPLT/metasploit/deps-metasploit.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$EXPLT/evilgrade/deps-evilgrade.txt") -r -- sudo apt-get install -y


#### 5.SE_Phishing
xargs -a <(awk '/^\s*[^#]/' "$EXPLT/5.SE_Phishing/se-toolkit/deps-SE-toolkit.txt") -r -- sudo apt-get install -y


# 4.PASS
## 1.Network
xargs -a <(awk '/^\s*[^#]/' "$PSSWDS/1.Network/brut3k1t/deps-brut3k1t.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$PSSWDS/1.Network/keimpx/deps-keimpx.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$PSSWDS/1.Network/medusa/deps-medusa.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$PSSWDS/1.Network/thc-hydra/deps-thc-hydra.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$PSSWDS/1.Network/thc-pptp-bruter/deps-thc-pptp-bruter.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$PSSWDS/1.Network/patator/deps-patator.txt") -r -- sudo apt-get install -y
## 2.Local
xargs -a <(awk '/^\s*[^#]/' "$PSSWDS/2.Local/1.WEP_WPA/cowpatty/deps-cowpatty.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$PSSWDS/2.Local/johnny/deps-johnny.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$PSSWDS/2.Local/johntheripper/deps-johntheripper.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$PSSWDS/2.Local/ophcrack/deps-ophcrack.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$PSSWDS/2.Local/rainbowcrack-ng/deps-rainbowcrack-ng.txt") -r -- sudo apt-get install -y


# 6. WIFI
xargs -a <(awk '/^\s*[^#]/' "$WRLSS/1.Wifi/2.Routerkeys/routerkeygenpc/deps-routerkeygenPC.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$WRLSS/1.Wifi/aircrack-ng/deps-aircrack-ng.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$WRLSS/1.Wifi/atear/deps-atear.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$WRLSS/1.Wifi/kismet/deps-kismet.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-wifipumpkin.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$WRLSS/1.Wifi/fruitywifi/deps-fruitywifi.txt") -r -- sudo apt-get install -y


# 7.MITM
xargs -a <(awk '/^\s*[^#]/' "$MITM/moloch/deps-moloch.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$MITM/bettercap/deps-bettercap.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$MITM/tcpflow/deps-tcpflow.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$MITM/2.DNS/dhsell/deps-dshell.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$MITM/3.VPN/fiked/deps-fiked.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$MITM/ettercap/deps-ettercap.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$MITM/mitmf/deps-mitmf.txt") -r -- sudo apt-get install -y
#xargs -a <(awk '/^\s*[^#]/' "$MITM/cdpsnarf/deps-cdpsnarf.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$MITM/netsniff-ng/deps-netsniff-ng.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$MITM/morpheus/deps-morpheus.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$MITM/wireshark/deps-wireshark.txt") -r -- sudo apt-get install -y

# 8.Tunnel
xargs -a <(awk '/^\s*[^#]/' "$TNNL/sslh/deps-sslh.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$TNNL/stunnel/deps-stunnel.txt") -r -- sudo apt-get install -y

# 9.Maintain Access
xargs -a <(awk '/^\s*[^#]/' "$MNTNACCS/1.OS-Backdoors/0.MultiOS-Backdoor/ares/deps-ares.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$MNTNACCS/1.OS-Backdoors/0.MultiOS-Backdoor/the-backdoor-factory/deps-backdoorfactory.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$MNTNACCS/1.OS-Backdoors/0.MultiOS-Backdoor/thefatrat/deps-thefatrat.txt") -r -- sudo apt-get install -y
xargs -a <(awk '/^\s*[^#]/' "$MNTNACCS/1.OS-Backdoors/0.MultiOS-Backdoor/webacoo/deps-webacoo.txt") -r -- sudo apt-get install -y
# 9.Maintain-Access/99.Misc
xargs -a <(awk '/^\s*[^#]/' "$MNTNACCS/99.Misc/exe2hex/deps-exe2hex.txt") -r -- sudo apt-get install -y

sudo apt-get install -y expect
###remove
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/main/remove-initial.txt") -r -- sudo apt-get purge --remove -y

sudo apt-get autoremove -y

sudo apt-get install -y linux-image-extra-$(uname -r) 
#sudo apt-get install -y linux-image-extra-virtual-$(uname -r)

sudo easy_install -U pip

sudo apt-get purge --remove -y openjdk-8-jre openjdk-8-jre openjdk-8-jre-headless
sudo updatedb
sudo ldconfig

cd /opt/ITSEC-Install-Scripts/0.Initial/src/settings-scripts/disable-services

sudo ./disable-all.sh
sudo phpenmod mcrypt
sudo phpenmod mbstring