#!/bin/bash
###############################
#
####################################
######################   7.Mitm   #
##################################
#cd /opt/ITSEC-Install-Scripts/7.Mitm/bdfproxy
#./bdfproxy.sh # https://github.com/mitmproxy/mitmproxy/issues/1234 
cd /opt/ITSEC-Install-Scripts/7.Mitm/bettercap
./bettercap.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/cdpsnarf
./cdpsnarf.sh #build fail
cd /opt/ITSEC-Install-Scripts/7.Mitm/det
./det.sh #PIP dependencies
#cd /opt/ITSEC-Install-Scripts/7.Mitm/dripcap
#./dripcap.sh #does not work - node problem
cd /opt/ITSEC-Install-Scripts/7.Mitm/ettercap
./ettercap.sh
#cd /opt/ITSEC-Install-Scripts/7.Mitm/hexinject
#./hexinject.sh #build fail make
#cd /opt/ITSEC-Install-Scripts/7.Mitm/mitmproxy
#./mitmproxy.sh # build fail
#cd /opt/ITSEC-Install-Scripts/7.Mitm/moloch
#./moloch.sh #build fail
cd /opt/ITSEC-Install-Scripts/7.Mitm/morpheus
./morpheus.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/mitmf
./mitmf.sh #PIP DEPENDENCIES
cd /opt/ITSEC-Install-Scripts/7.Mitm/netsniff-ng
./netsniff-ng.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/nfspy
./nfspy.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/p0f
./p0f.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/responder
./responder.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/sniffjoke
./sniffjoke.sh
#cd /opt/ITSEC-Install-Scripts/7.Mitm/sslsniff
#./sslsniff.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/sslsplit
./sslsplit.sh #see install script for version/provider options
#cd /opt/ITSEC-Install-Scripts/7.Mitm/stenographer
#./stenographer.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/tcpflow
./tcpflow.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/wireshark
./wireshark.sh 
#
#
###############################################################################
######################   2.DNS   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/7.Mitm/2.DNS/dnschef
./dnschef.sh
cd /opt/ITSEC-Install-Scripts/7.Mitm/2.DNS/dshell
./dshell.sh 
#
#
###############################################################################
######################   3.VPN   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/7.Mitm/3.VPN/fiked
./fiked.sh 
#
#
###############################################################################
######################   3.VPN   ####################
###########################################################################
#cd /opt/ITSEC-Install-Scripts/7.Mitm/4.Replay
#./tcpreplay.sh #DOES NOT WORK - installed from apt