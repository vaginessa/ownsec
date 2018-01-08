#!/bin/bash
###############################
BASEDIR=/opt/ownsec/7.Mitm
####################################
######################   7.Mitm   #
##################################
#cd $BASEDIR/bdfproxy
#./bdfproxy-install.sh # https://github.com/mitmproxy/mitmproxy/issues/1234 
cd $BASEDIR/bettercap
./bettercap-install.sh
cd $BASEDIR/cdpsnarf
./cdpsnarf-install.sh #build fail
cd $BASEDIR/det
./det-install.sh #PIP dependencies
#cd $BASEDIR/dripcap
#./dripcap-install.sh #does not work - node problem
cd $BASEDIR/ettercap
./ettercap-install.sh
#cd $BASEDIR/hexinject
#./hexinject-install.sh #build fail make
#cd $BASEDIR/mitmproxy
#./mitmproxy-install.sh # build fail
#cd $BASEDIR/moloch
#./moloch-install.sh #build fail
cd $BASEDIR/morpheus
./morpheus-install.sh
cd $BASEDIR/mitmf
./mitmf-install.sh #PIP DEPENDENCIES
cd $BASEDIR/netsniff-ng
./netsniff-ng-install.sh
cd $BASEDIR/nfspy
./nfspy-install.sh
cd $BASEDIR/p0f
./p0f-install.sh
cd $BASEDIR/responder
./responder-install.sh
cd $BASEDIR/sniffjoke
./sniffjoke-install.sh
#cd $BASEDIR/sslsniff
#./sslsniff-install.sh
cd $BASEDIR/sslsplit
./sslsplit-install.sh #see install script for version/provider options
#cd $BASEDIR/stenographer
#./stenographer-install.sh
cd $BASEDIR/tcpflow
./tcpflow-install.sh
cd $BASEDIR/wireshark
./wireshark-install.sh 
#
#
###############################################################################
######################   2.DNS   ####################
###########################################################################
cd $BASEDIR/2.DNS/dnschef
./dnschef-install.sh
cd $BASEDIR/2.DNS/dshell
./dshell-install.sh 
#
#
###############################################################################
######################   3.VPN   ####################
###########################################################################
cd $BASEDIR/3.VPN/fiked
./fiked-install.sh 
#
#
###############################################################################
######################   replay  ####################
###########################################################################
#cd $BASEDIR/4.Replay
#./tcpreplay-install.sh #DOES NOT WORK - installed from apt
#
#
###############################################################################
######################   4.RDP  ####################
###########################################################################
cd $BASEDIR/4.RDP/seth
./seth-install.sh 