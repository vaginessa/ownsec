#!/bin/bash
###############################

BASEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering

######################################################
######################   1.Information-Gathering    #
####################################################
#
#
###############################################################################
######################   1.Network_Portscanner   ####################
###########################################################################
cd $BASEDIR/1.Network_Portscanner/nmap
./nmap-install.sh
cd $BASEDIR/1.Network_Portscanner/masscan
./masscan-install.sh
cd $BASEDIR/1.Network_Portscanner/thanos
./thanos-install.sh
cd $BASEDIR/1.Network_Portscanner/zmap
./zmap-install.sh
cd $BASEDIR/1.Network_Portscanner/spiderfoot
./spiderfoot-install.sh
#
#
###############################################################################
######################  2.Live-Host  ####################
###########################################################################
cd $BASEDIR/2.Live-Host/arping
./arping-install.sh
cd $BASEDIR/2.Live-Host/dmitry
./dmitry-install.sh
cd $BASEDIR/2.Live-Host/fping
./fping-install.sh
cd $BASEDIR/2.Live-Host/hping3
./hping-install.sh
cd $BASEDIR/2.Live-Host/netdiscover
./netdiscover-install.sh
cd $BASEDIR/2.Live-Host/recon-ng
./recon-ng-install.sh
cd $BASEDIR/2.Live-Host/wol-e
./wol-e-install.sh
#
# 2.Live-Host - 1.Cloudflare ####
cd $BASEDIR/2.Live-Host/1.Cloudflare/cloud-buster
./cloud-buster-install.sh 
#
# 2.Live-Host - 2.VPN ####
cd $BASEDIR/2.Live-Host/2.VPN/ike-scan
./ike-scan-install.sh 
#
# 2.Live-Host 3.IPv6 ####
cd $BASEDIR/2.Live-Host/3.IPv6/thc-ipv6
./thc-ipv6-install.sh 
#
# 2.Live-Host 4.Load-Balancer ####
cd $BASEDIR/2.Live-Host/4.Load-Balancer/lbd
./lbd-install.sh
#
#
###############################################################################
######################  3.Route-Analysis ####################
###########################################################################
cd $BASEDIR/3.Route-Analysis/0trace
./0trace-install.sh #PIPdependencies 
cd $BASEDIR/3.Route-Analysis/intrace
./intrace-install.sh #probaly problems, check again 
#cd $BASEDIR/3.Route-Analysis/irpas
# ./irpas-install.sh source site down - script worked
#
# 3.Route-Analysis - 1.Cloudflare ###
cd $BASEDIR/3.Route-Analysis/1.Cloudflare/bypasscf
./bypasscf-install.sh 
#
#
###############################################################################
######################   4.SSL   ####################
###########################################################################
cd $BASEDIR/4.SSL/sslcaudit
./sslcaudit-install.sh
cd $BASEDIR/4.SSL/sslh
./sslh-install.sh
#cd $BASEDIR/4.SSL/sslstrip2
#./sslstrip2
cd $BASEDIR/4.SSL/sslyze_nabla_c0d3
./sslyze_nabla-c0d3-install.sh
#cd $BASEDIR/4.SSL/tls-prober #unfinished script
#./tls-prober-install.sh
#
#
###############################################################################
######################   5.DNS  ####################
###########################################################################
cd $BASEDIR/5.DNS/dnsenum
./dnsenum-install.sh
cd $BASEDIR/5.DNS/dnsmap
./dnsmap-install.sh
cd $BASEDIR/5.DNS/dnsrecon
./dnsrecon-install.sh #PIP dependencies #
cd $BASEDIR/5.DNS/dnstracer
./dnstracer-install.sh
cd $BASEDIR/5.DNS/fierce
./fierce-install.sh
cd $BASEDIR/5.DNS/passivedns
./passivedns-install.sh
#
#
###############################################################################
######################   6.SMB  ####################
###########################################################################
cd $BASEDIR/6.SMB/acccheck
./acccheck-install.sh
cd $BASEDIR/6.SMB/enum4linux
./enum4linux-install.sh #PROBALY MISSING PARTS SETUP, CHECK AGAIN
cd $BASEDIR/6.SMB/nbtscan
./nbtscan-install.sh
cd $BASEDIR/6.SMB/smbmap
#./smbmap-install.sh #disabled it earlier, got to check again.
#
#
###############################################################################
######################   7.SMTP   ####################
###########################################################################
cd $BASEDIR/7.SMTP/smtp-userenum
./smtp-userenum-install.sh
cd $BASEDIR/7.SMTP/swaks
./swaks-install.sh 
#
#
###############################################################################
######################   8.SNMP    ####################
###########################################################################
cd $BASEDIR/8.SNMP/braa
./braa-install.sh 
#
#
###############################################################################
######################   10.Onion    ####################
###########################################################################
#cd $BASEDIR/10.Onion
#
#
###############################################################################
######################   11. Dork    ####################
###########################################################################
cd $BASEDIR/11.Dork/bingoo
./bingoo-install.sh
cd $BASEDIR/11.Dork/scanner-inurlbr
./scanner-inurlbr-install.sh 
#
###############################################################################
######################   12.Scrape   ####################
###########################################################################
# cd $BASEDIR/12.Scrape/
#./httrack-install.sh #did not work off git, using apt
#
###############################################################################
######################   13.OSINT   ####################
###########################################################################
cd $BASEDIR/13.OSINT/metagoofil
./metagoofil-install.sh
cd $BASEDIR/13.OSINT/tekdefense-automater
./tekdefense-automater-install.sh
cd $BASEDIR/13.OSINT/theharvester
./theharvester-install.sh
cd $BASEDIR/13.OSINT/twofi
./twofi-install.sh
cd $BASEDIR/13.OSINT/urlcrazy
./urlcrazy-install.sh
cd $BASEDIR/13.OSINT/datasploit
./datasploit-install.sh
#
#
###############################################################################
######################   14.Web-Firewalls   ####################
###########################################################################
cd $BASEDIR/14.Web-Firewalls/wafw00f
./wafw00f-install.sh # needs makefile fix for pip "sudo -H pip install ..."


###############################################################################
######################   15.Fuzzer   ####################
###########################################################################
cd $BASEDIR/15.Fuzzer/dotdotpwn
./dotdotpwn-install.sh
cd $BASEDIR/15.Fuzzer/simple-fuzzer
./simplefuzzer-install.sh # call w sfuzz 
cd $BASEDIR/15.Fuzzer/siparmyknife
./siparmyknife-install.sh 
#
###############################################################################
######################   16.IDS-IPS_Identification   ####################
###########################################################################
#cd $BASEDIR/16.IDS-IPS_Identification/fir
#./fir-install.sh #something not working
cd $BASEDIR/16.IDS-IPS_Identification/ftester
./ftester-install.sh 



