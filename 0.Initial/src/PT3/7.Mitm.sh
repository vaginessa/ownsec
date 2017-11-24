#!/bin/bash
###############################
#
####################################
######################   7.Mitm   #
##################################
#cd /opt/ITSEC-Install-Scripts/7.Mitm/bdfproxy
#./bdfproxy-install.sh # https://github.com/mitmproxy/mitmproxy/issues/1234 
cd /opt/ITSEC-Install-Scripts/7.Mitm/bettercap
./bettercap-install.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/cdpsnarf
./cdpsnarf-install.sh #build fail
cd /opt/ITSEC-Install-Scripts/7.Mitm/det
./det-install.sh #PIP dependencies
#cd /opt/ITSEC-Install-Scripts/7.Mitm/dripcap
#./dripcap-install.sh #does not work - node problem
cd /opt/ITSEC-Install-Scripts/7.Mitm/ettercap
./ettercap-install.sh
#cd /opt/ITSEC-Install-Scripts/7.Mitm/hexinject
#./hexinject-install.sh #build fail make
#cd /opt/ITSEC-Install-Scripts/7.Mitm/mitmproxy
#./mitmproxy-install.sh # build fail
#cd /opt/ITSEC-Install-Scripts/7.Mitm/moloch
#./moloch-install.sh #build fail
cd /opt/ITSEC-Install-Scripts/7.Mitm/morpheus
./morpheus-install.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/mitmf
./mitmf-install.sh #PIP DEPENDENCIES
cd /opt/ITSEC-Install-Scripts/7.Mitm/netsniff-ng
./netsniff-ng-install.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/nfspy
./nfspy-install.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/p0f
./p0f-install.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/responder
./responder-install.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/sniffjoke
./sniffjoke-install.sh
#cd /opt/ITSEC-Install-Scripts/7.Mitm/sslsniff
#./sslsniff-install.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/sslsplit
./sslsplit-install.sh #see install script for version/provider options
#cd /opt/ITSEC-Install-Scripts/7.Mitm/stenographer
#./stenographer-install.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/tcpflow
./tcpflow-install.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/wireshark
./wireshark-install.sh 
#
#
###############################################################################
######################   2.DNS   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/7.Mitm/2.DNS/dnschef
./dnschef-install.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/2.DNS/dshell
./dshell-install.sh 
#
#
###############################################################################
######################   3.VPN   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/7.Mitm/3.VPN/fiked
./fiked-install.sh 
#
#
###############################################################################
######################   3.VPN   ####################
###########################################################################
#cd /opt/ITSEC-Install-Scripts/7.Mitm/4.Replay
#./tcpreplay-install.sh #DOES NOT WORK - installed from apt