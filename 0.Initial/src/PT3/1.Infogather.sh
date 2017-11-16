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
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/1.Network_Portscanner/nmap
./nmap.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/1.Network_Portscanner/masscan
./masscan.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/1.Network_Portscanner/thanos
./thanos.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/1.Network_Portscanner/zmap
./zmap.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/1.Network_Portscanner/spiderfoot
./spiderfoot.sh
#
#
###############################################################################
######################  2.Live-Host  ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/2.Live-Host/arping
./arping.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/2.Live-Host/dmitry
./dmitry.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/2.Live-Host/fping
./fping.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/2.Live-Host/hping
./hping.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/2.Live-Host/netdiscover
./netdiscover.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/2.Live-Host/recon-ng
./recon-ng.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/2.Live-Host/wol-e
./wol-e.sh
#
# 2.Live-Host - 1.Cloudflare ####
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/2.Live-Host/1.Cloudflare/cloud-buster
./cloud-buster.sh 
#
# 2.Live-Host - 2.VPN ####
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/2.Live-Host/2.VPN/ike-scan
./ike-scan.sh 
#
# 2.Live-Host 3.IPv6 ####
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/2.Live-Host/3.IPv6
./thc-ipv6.sh 
#
# 2.Live-Host 4.Load-Balancer ####
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/2.Live-Host/4.Load-Balancer/lbd
./lbd.sh
#
#
###############################################################################
######################  3.Route-Analysis ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/3.Route-Analysis/0trace
./0trace.sh #PIPdependencies 
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/3.Route-Analysis/intrace
./intrace.sh #probaly problems, check again 
#cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/3.Route-Analysis/irpas
# ./irpas.sh source site down - script worked
#
# 3.Route-Analysis - 1.Cloudflare ###
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf
./bypasscf.sh 
#
#
###############################################################################
######################   4.SSL   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/4.SSL/sslcaudit
./sslcaudit.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/4.SSL/sslh
./sslh.sh
#cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/4.SSL/sslstrip2
#./sslstrip2
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/4.SSL/sslyze_nabla-c0d3
./sslyze_nabla-c0d3.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/4.SSL/tls-prober
#./tls-prober.sh
#
#
###############################################################################
######################   5.DNS  ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/5.DNS/dnsenum
./dnsenum.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/5.DNS/dnsmap
./dnsmap.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/5.DNS/dnsrecon
./dnsrecon.sh #PIP dependencies #
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/5.DNS/dnstracer
./dnstracer.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/5.DNS/fierce
./fierce.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/5.DNS/passivedns
./passivedns.sh
#
#
###############################################################################
######################   6.SMB  ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/6.SMB/acccheck
./acccheck.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/6.SMB/enum4linux
./enum4linux.sh #PROBALY MISSING PARTS SETUP, CHECK AGAIN
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/6.SMB/nbtscan
./nbtscan.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/6.SMB/smbmap
#./smbmap.sh #disabled it earlier, got to check again.
#
#
###############################################################################
######################   7.SMTP   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/7.SMTP/smtp-user-enum
./smtp-user-enum.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/7.SMTP/swaks
./swaks.sh 
#
#
###############################################################################
######################   8.SNMP    ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/8.SNMP/braa
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
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/11.Dork/bingoo
./bingoo.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/11.Dork/scanner-inurlbr
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
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/13.OSINT/metagoofil
./metagoofil.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/13.OSINT/tekdefense-automater
./tekdefense-automater.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/13.OSINT/theharvester
./theharvester.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/13.OSINT/twofi
./twofi.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/13.OSINT/urlcrazy
./urlcrazy.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/13.OSINT/datasploit
./datasploit.sh
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
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/15.Fuzzer/dotdotpwn
./dotdotpwn.sh
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/15.Fuzzer/simplefuzzer
./simplefuzzer.sh # call w sfuzz 
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/15.Fuzzer/siparmyknife
./siparmyknife.sh 
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/15.Fuzzer/dirb
./dirb.sh
#
###############################################################################
######################   16.IDS-IPS_Identification   ####################
###########################################################################
#cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/16.IDS-IPS_Identification/fir
#./fir.sh #something not working
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/16.IDS-IPS_Identification/ftester
./ftester.sh 

# 16.IDS-IPS_Identification ###1.Web-Firewalls
cd /opt/ITSEC-Install-Scripts/1.Information-Gathering/16.IDS-IPS_Identification/1.Web-Firewalls/wafw00f
./wafw00f.sh # needs makefile fix for pip "sudo -H pip install ..."



