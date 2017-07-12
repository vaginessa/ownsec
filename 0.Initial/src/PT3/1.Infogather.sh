#!/bin/bash
###############################
#
######################################################
######################   1.Information-Gathering    #
####################################################
#
#
###############################################################################
######################   1.Network_Portscanner   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/1.Network_Portscanner/
./nmap.sh 
./masscan.sh 
./thanos.sh 
./zmap.sh 
./spiderfoot.sh
#
#
###############################################################################
######################  2.Live-Host  ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/2.Live-Host
./arping.sh 
./dmitry.sh 
./fping.sh 
./hping.sh 
./netdiscover.sh 
./recon-ng.sh 
./wol-e 
#
# 2.Live-Host - 1.Cloudflare ####
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/2.Live-Host/1.Cloudflare
./cloud-buster.sh 
#
# 2.Live-Host - 2.VPN ####
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/2.Live-Host/2.VPN
./ike-scan.sh 
#
# 2.Live-Host 3.IPv6 ####
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/2.Live-Host/3.IPv6
./thc-ipv6.sh 
#
# 2.Live-Host 4.Load-Balancer ####
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/2.Live-Host/4.Load-Balancer
./lbd 
#
#
###############################################################################
######################  3.Route-Analysis ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/3.Route-Analysis
./0trace  #PIPdependencies 
./intrace #probaly problems, check again 
# ./irpas source site down - script worked
#
# 3.Route-Analysis - 1.Cloudflare ###
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/3.Route-Analysis/1.Cloudflare
./bypasscf.sh 
#
#
###############################################################################
######################   4.SSL   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/4.SSL
./sslaudit.sh 
./sslh.sh 
#./sslstrip2
./sslyze_nabla-c0d3.sh 
#./tls-prober.sh
#
#
###############################################################################
######################   5.DNS  ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/5.DNS
./dnsenum.sh 
./dnsmap.sh 
./dnsrecon.sh #PIP dependencies # 
./dnstracer.sh 
./fierce.sh 
./passivedns.sh
#
#
###############################################################################
######################   6.SMB  ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/6.SMB
./acccheck.sh 
./enum4linux.sh #PROBALY MISSING PARTS SETUP, CHECK AGAIN 
./nbtscan.sh 
#./smbmap.sh #disabled it earlier, got to check again.
#
#
###############################################################################
######################   7.SMTP   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/7.SMTP/
./smtp-user-enum.sh 
./swaks.sh 
#
#
###############################################################################
######################   8.SNMP    ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/8.SNMP/
./braa.sh 
#
#
###############################################################################
######################   10.Onion    ####################
###########################################################################
#cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/10.Onion
#
#
###############################################################################
######################   11. Dork    ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/11.Dork/
./bingoo.sh 
./scanner-inurlbr.sh 
#
###############################################################################
######################   12.Scrape   ####################
###########################################################################
# cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/12.Scrape/
#./httrack.sh #did not work off git, using apt
#
###############################################################################
######################   13.OSINT   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/13.OSINT
./metagoofil.sh 
./tekdefense-automater.sh 
./theharvester.sh 
./twofi.sh 
./urlcrazy 
#
#
###############################################################################
######################   14.Honeypot   ####################
###########################################################################
# nothing todo here
#
#

#
###############################################################################
######################   15.Fuzzer   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/15.Fuzzer
./dotdotpwn.sh 
./simplefuzzer.sh # call w sfuzz 
./siparmyknife.sh 
./dirb.sh
#
###############################################################################
######################   16.IDS-IPS_Identification   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/16.IDS-IPS_Identification
#./fir.sh #something not working
./ftester.sh 

# 16.IDS-IPS_Identification ###1.Web-Firewalls
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/16.IDS-IPS_Identification/1.Web-Firewalls
#./wafw00f.sh # needs makefile fix for pip "sudo -H pip install ..."



