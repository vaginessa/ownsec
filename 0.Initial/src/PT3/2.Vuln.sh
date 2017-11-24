#!/bin/bash

###############################################################################
######################   1.Vulnerability-Scanner   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/openvas-setup-files
./openvas9-install.sh  # at times disbled to debug other scripts
#
#1.Vulnerability-Scanner ##########################################################
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/arachni
./arachni-install.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/atscan
./atscan-install.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/ava
#./ava-install.sh #didnt work, dont remember why, checkin later.
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/bed
./bed-install.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/blindelephant
./blindelephant-install.sh #console link has be called with - mark the capital B "Blindelephant.py
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/commix
./commix-install.sh 
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/d-tect
./d-tect-install.sh # (needs console linking through d-tect-install.sh)
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/golismero
./golismero-install.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/hellraiser
./hellraiser-install.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/joomscan
./joomscan-install.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/lhf
./lhf-install.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/lightbulb-framework
./lightbulb-framework-install.sh #PIP dependency  - needs check - 
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/lynis
./lynis-install.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/nikto
./nikto-install.sh #check nikto.conf complained 
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/owasp-webscarab
./owasp-webscarab-install.sh
#cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/proxystrike
#./proxystrike-install.sh # complains openssl 1.1.0 which does not really work on the setup- breaks all sorts of things.
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/pyfiscan
./pyfiscan-install.sh #PIP dependency  - needs check - 
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/sn1per
./sn1per-install.sh # check plugin errors  /usr/share/sniper/plugins/Findsploit/: No such file or directory
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/sparta
./sparta-install.sh  # 
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/v3n0m-scanner
./v3n0m-scanner-install.sh #PIP dependencies - 
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/vbscan
./vbscan-install.sh 
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/w3af
./w3af-install.sh
#cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/wapiti
#./wapiti-install.sh # did not work but worked prev.ubu1604_4.8.0-53-generic_04-06-2017 
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/whatweb
./whatweb-install.sh 
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/wpscan
#./wpscan-install.sh ruby app - see readme - rbenv shell doesent work yet
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/zaproxy
./zaproxy-install.sh # requires userinput during setup - check that again
#
###############################################################################
######################   2.Cisco-Tools   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/2.Cisco-Tools/cisco-auditing-tool
./cisco-auditing-tool-install.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/2.Cisco-Tools/cisco-global-exploiter
./cisco-global-exploiter-install.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/2.Cisco-Tools/cisco-ocs
##cisco-ocs-install.sh #greyd out earl, no idea why
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/2.Cisco-Tools/cisco-torch
##cisco-torch-install.sh #greyd out earl, no idea why
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/2.Cisco-Tools/copy-router-config
#./copy-router-config-install.sh #stopped working somehow,chk bk ltr.
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/2.Cisco-Tools/yersinia
./yersinia-install.sh  - wild building lots warnings.

###############################################################################
######################   3.LFI-RFI   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/3.LFI-RFI/fimap
./fimap-install.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/3.LFI-RFI/kadabra
./kadabra-install.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/3.LFI-RFI/kadimus
./kadimus-install.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/3.LFI-RFI/lfifreak
./lfifreak-install.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/3.LFI-RFI/liffy
./liffy-install.sh # runs BUT: AttributeError: 'NoneType' object has no attribute 'find'
#
###############################################################################
######################   5.Voip   ####################
###########################################################################
#cd /opt/ITSEC-Install-Scripts/5.Voip/
#
###############################################################################
######################   6.Webapp-Identification   ####################
###########################################################################
#cd /opt/ITSEC-Install-Scripts/6.Webapp-Identification/
#
###############################################################################
######################   7.Webapp-Proxies   ####################
###########################################################################
#cd /opt/ITSEC-Install-Scripts/7.Webapp-Proxies/
#

