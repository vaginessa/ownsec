#!/bin/bash

BASEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/2.Vulnerability-Scanner
###############################################################################
######################   1.Vulnerability-Scanner   ####################
###########################################################################
cd $BASEDIR/openvas-setup-files
./openvas9-install.sh  # at times disbled to debug other scripts
#
#1.Vulnerability-Scanner ##########################################################
cd $BASEDIR/arachni
./arachni-install.sh
cd $BASEDIR/atscan
./atscan-install.sh
cd $BASEDIR/ava
#./ava-install.sh #didnt work, dont remember why, checkin later.
cd $BASEDIR/bed
./bed-install.sh
cd $BASEDIR/blindelephant
./blindelephant-install.sh #console link has be called with - mark the capital B "Blindelephant.py
cd $BASEDIR/commix
./commix-install.sh 
cd $BASEDIR/d-tect
./d-tect-install.sh # (needs console linking through d-tect-install.sh)
cd $BASEDIR/golismero
./golismero-install.sh
cd $BASEDIR/hellraiser
./hellraiser-install.sh
cd $BASEDIR/joomscan
./joomscan-install.sh
cd $BASEDIR/lhf
./lhf-install.sh
cd $BASEDIR/lightbulb-framework
./lightbulb-framework-install.sh #PIP dependency  - needs check - 
cd $BASEDIR/lynis
./lynis-install.sh
cd $BASEDIR/nikto
./nikto-install.sh #check nikto.conf complained 
cd $BASEDIR/owasp-webscarab
./owasp-webscarab-install.sh
#cd $BASEDIR/proxystrike
#./proxystrike-install.sh # complains openssl 1.1.0 which does not really work on the setup- breaks all sorts of things.
cd $BASEDIR/pyfiscan
./pyfiscan-install.sh #PIP dependency  - needs check - 
cd $BASEDIR/sn1per
./sn1per-install.sh # check plugin errors  /usr/share/sniper/plugins/Findsploit/: No such file or directory
cd $BASEDIR/sparta
./sparta-install.sh  # 
cd $BASEDIR/v3n0m-scanner
./v3n0m-scanner-install.sh #PIP dependencies - 
cd $BASEDIR/vbscan
./vbscan-install.sh 
cd $BASEDIR/w3af
./w3af-install.sh
#cd $BASEDIR/wapiti
#./wapiti-install.sh # did not work but worked prev.ubu1604_4.8.0-53-generic_04-06-2017 
cd $BASEDIR/whatweb
./whatweb-install.sh 
cd $BASEDIR/wpscan
#./wpscan-install.sh ruby app - see readme - rbenv shell doesent work yet
cd $BASEDIR/zaproxy
./zaproxy-install.sh # requires userinput during setup - check that again
#
###############################################################################
######################   2.Cisco-Tools   ####################
###########################################################################
cd $BASEDIR/2.Cisco-Tools/cisco-auditing-tool
./cisco-auditing-tool-install.sh
cd $BASEDIR/2.Cisco-Tools/cisco-global-exploiter
./cisco-global-exploiter-install.sh
cd $BASEDIR/2.Cisco-Tools/cisco-ocs
##cisco-ocs-install.sh #greyd out earl, no idea why
cd $BASEDIR/2.Cisco-Tools/cisco-torch
##cisco-torch-install.sh #greyd out earl, no idea why
cd $BASEDIR/2.Cisco-Tools/copy-router-config
#./copy-router-config-install.sh #stopped working somehow,chk bk ltr.
cd $BASEDIR/2.Cisco-Tools/yersinia
./yersinia-install.sh  - wild building lots warnings.

###############################################################################
######################   3.LFI-RFI   ####################
###########################################################################
cd $BASEDIR/3.LFI-RFI/fimap
./fimap-install.sh
cd $BASEDIR/3.LFI-RFI/kadabra
./kadabra-install.sh
cd $BASEDIR/3.LFI-RFI/kadimus
./kadimus-install.sh
cd $BASEDIR/3.LFI-RFI/lfifreak
./lfifreak-install.sh
cd $BASEDIR/3.LFI-RFI/liffy
./liffy-install.sh # runs BUT: AttributeError: 'NoneType' object has no attribute 'find'
#
###############################################################################
######################   5.Voip   ####################
###########################################################################
#cd /opt/ownsec/5.Voip/
#
###############################################################################
######################   6.Webapp-Identification   ####################
###########################################################################
#cd /opt/ownsec/6.Webapp-Identification/
#
###############################################################################
######################   7.Webapp-Proxies   ####################
###########################################################################
#cd /opt/ownsec/7.Webapp-Proxies/
#

