#!/bin/bash
###############################
#
####################################
######################   7.Mitm   #
##################################
cd /opt/ITSEC-Install-Scripts/7.Mitm
#./bdfproxy.sh # https://github.com/mitmproxy/mitmproxy/issues/1234 
./bettercap.sh 
./cdpsnarf.sh #build fail
./det.sh #PIP dependencies 
#./dripcap.sh #does not work - node problem
./ettercap.sh 
#./hexinject.sh #build fail make
#./mitmproxy.sh # build fail
#./moloch.sh #build fail
./morpheus.sh 
./mitmf.sh #PIP DEPENDENCIES 
./netsniff-ng.sh 
./nfspy.sh 
./p0f.sh 
./responder.sh 
./sniffjoke.sh 
#./sslsniff.sh
./sslsplit.sh #see install script for version/provider options 
#./stenographer.sh
./tcpflow.sh 
./wireshark.sh 
#
#
###############################################################################
######################   2.DNS   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/7.Mitm/2.DNS
./dnschef.sh 
./dshell.sh 
#
#
###############################################################################
######################   3.VPN   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/7.Mitm/3.VPN
./fiked.sh 
#
#
###############################################################################
######################   3.VPN   ####################
###########################################################################
#cd /opt/ITSEC-Install-Scripts/7.Mitm/4.Replay
#./tcpreplay.sh #DOES NOT WORK - installed from apt