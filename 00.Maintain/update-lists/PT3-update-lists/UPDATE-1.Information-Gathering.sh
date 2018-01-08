#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

BASEDIR=/opt/ownsec/1.Information-Gathering

echo "${bold}
 _   _ ____  ____    _  _____ _____ 
| | | |  _ \|  _ \  / \|_   _| ____|
| | | | |_) | | | |/ _ \ | | |  _|  
| |_| |  __/| |_| / ___ \| | | |___ 
 \___/|_|   |____/_/   \_\_| |_____|

1.Information-Gathering
${normal}"

################## 1.Network_Portscanner ##################

cd $BASEDIR/1.Network_Portscanner/masscan
./masscan-update.sh

cd $BASEDIR/1.Network_Portscanner/nmap
./nmap-update.sh

cd $BASEDIR/1.Network_Portscanner/spiderfoot
./spiderfoot-update.sh

cd $BASEDIR/1.Network_Portscanner/thanos
./thanos-update.sh

#cd $BASEDIR/1.Network_Portscanner/xplico
#./xplico-update.sh

cd $BASEDIR/1.Network_Portscanner/zmap
./zmap-update.sh


################## 2.Live-Host ##################

cd $BASEDIR/2.Live-Host/arping
./arping-update.sh

cd $BASEDIR/2.Live-Host/dmitry
./dmitry-update.sh

cd $BASEDIR/2.Live-Host/fping
./fping-update.sh

cd $BASEDIR/2.Live-Host/hping
./hping-update.sh

cd $BASEDIR/2.Live-Host/netdiscover
./netdiscover-update.sh

cd $BASEDIR/2.Live-Host/recon-ng
./recon-ng-update.sh

cd $BASEDIR/2.Live-Host/wol-e
./wol-e-update.sh

## 1.Cloudflare

cd $BASEDIR/2.Live-Host/1.Cloudflare/cloud-buster
./cloud-buster-update.sh

## 2.VPN

cd $BASEDIR/2.Live-Host/2.VPN/ike-scan
./ike-scan-update.sh

## 3.IPv6
cd $BASEDIR/2.Live-Host/3.IPv6/thc-ipv6
./thc-ipv6-update.sh

## 4.Load-Balancer
cd $BASEDIR/2.Live-Host/4.Load-Balancer/lbd
./lbd-update.sh

################## 3.Route-Analysis ##################

cd $BASEDIR/3.Route-Analysis/0trace
./0trace-update.sh

cd $BASEDIR/3.Route-Analysis/intrace
./intrace-update.sh

# not a git repo, need to find a smart routine 
#cd $BASEDIR/3.Route-Analysis/irpas
#./irpas-update.sh

# 1.Cloudflare
cd $BASEDIR/3.Route-Analysis/1.Cloudflare/bypasscf
./bypasscf-update.sh

################## 4.SSL ##################

cd $BASEDIR/4.SSL/sslcaudit/
./sslcaudit-update.sh

# install apt
#cd $BASEDIR/4.SSL/sslstrip
#./#sslstrip2-update.sh

cd $BASEDIR/4.SSL/sslyze_nabla_c0d3
./sslyze_nabla-c0d3-update.sh

#cd $BASEDIR/4.SSL/tlsprober
#./#tls-prober-update.sh

################## 5.DNS ##################

cd $BASEDIR/5.DNS/dnsenum
./dnsenum-update.sh

# not a git repo
#cd $BASEDIR/5.DNS/dnsmap
#./dnsmap-update.sh

cd $BASEDIR/5.DNS/dnsrecon
./dnsrecon-update.sh

cd $BASEDIR/5.DNS/dnstracer
./dnstracer-update.sh

cd $BASEDIR/5.DNS/fierce/
./fierce-update.sh

cd $BASEDIR/5.DNS/passivedns
./passivedns-update.sh

################## 6.SMB ##################

# not a git repo
#cd $BASEDIR/6.SMB/accceck
#./acccheck-update.sh

cd $BASEDIR/6.SMB/enum4linux
./enum4linux-update.sh

#cd $BASEDIR/6.SMB/nbtscan
#./nbtscan-update.sh

#cd $BASEDIR/6.SMB/smbmap
#./smbmap-update.sh

################## 7.SMTP ##################

cd $BASEDIR/7.SMTP/smtp-userenum
./smtp-user-enum-update.sh

cd $BASEDIR/7.SMTP/swaks
./swaks-update.sh

################## 8.SNMP ##################

cd $BASEDIR/8.SNMP/braa
./braa-update.sh

#incomplete setup 
#cd $BASEDIR/8.SNMP/snmp-check
#./snmp-check-update.sh

################## 11.Dork ##################

cd $BASEDIR/11.Dork/bingoo
./bingoo-update.sh

cd $BASEDIR/11.Dork/scanner-inurlbr
./scanner-inurlbr-update.sh

################## 12.Scrape ##################

#installe w apt
#cd $BASEDIR/12.Scrape/httrack
#./httrack-update.sh

################## 13.OSINT ##################

#cd $BASEDIR/13.OSINT/cewl
#./cewl-update.sh

#cd $BASEDIR/13.OSINT/creepy
#./creepy-update.sh

cd $BASEDIR/13.OSINT/datasploit
./datasploit-update.sh

#cd $BASEDIR/13.OSINT/maltegoce
#./maltegoce-update.sh

cd $BASEDIR/13.OSINT/metagoofil
./metagoofil-update.sh

cd $BASEDIR/13.OSINT/tekdefense-automater
./tekdefense-automater-update.sh

cd $BASEDIR/13.OSINT/theharvester
./theharvester-update.sh

cd $BASEDIR/13.OSINT/twofi
./twofi-update.sh

cd $BASEDIR/13.OSINT/urlcrazy
./urlcrazy-update.sh


### 14.Web-Firewalls

cd $BASEDIR/14.Web-Firewalls/wafw00f
./wafw00f-update.sh


################## 15.Fuzzer ##################

cd $BASEDIR/15.Fuzzer/dirb
./dirb-update.sh

# incomplete setup
#cd $BASEDIR/15.Fuzzer/dirbuster-ng
#./dirbuster-ng-update.sh

cd $BASEDIR/15.Fuzzer/dotdotpwn
./dotdotpwn.sh

# incomplete setup
#cd $BASEDIR/15.Fuzzer/pydirbuster
#./pydirbuster-update.sh

cd $BASEDIR/15.Fuzzer/simplefuzzer
./simplefuzzer-update.sh

cd $BASEDIR/15.Fuzzer/siparmyknife
./siparmyknife-update.sh

# incokmplete setup
#cd $BASEDIR/15.Fuzzer/subbrute
#./subbrute-update.sh

# incomplete setup
#cd $BASEDIR/15.Fuzzer/sublist3r
#./sublist3r-update.sh

################## 16.IDS-IPS_Identification ##################

#cd $BASEDIR/16.IDS-IPS_Identification/fir
#./fir-update-update.sh

cd $BASEDIR/16.IDS-IPS_Identification/ftester
./ftester-update.sh


echo "${bold}
 ____   ___  _   _ _____ 
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|  
| |_| | |_| | |\  | |___ 
|____/ \___/|_| \_|_____|
      
1.Information-Gathering updated 
If you catch bugs - issue them or push - thx
${normal}"
