#!/bin/bash

###############################################################################
######################   1.Vulnerability-Scanner   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/openvas-setup-files
./openvas9-setup.sh  # at times disbled to debug other scripts
#
#1.Vulnerability-Scanner ##########################################################
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/arachni
./arachni.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/atscan
./atscan.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/ava
#./ava.sh #didnt work, dont remember why, checkin later.
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/bed
./bed.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/blindelephant
./blindelephant.sh #console link has be called with - mark the capital B "Blindelephant.py
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/commix
./commix.sh 
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/d-tect
./d-tect.sh # (needs console linking through d-tect.sh)
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/golismero
./golismero.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/hellraiser
./hellraiser.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/joomscan
./joomscan.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/lhf
./lhf.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/lightbulb-framework
./lightbulb-framework.sh #PIP dependency  - needs check - 
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/lynis
./lynis.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/nikto
./nikto.sh #check nikto.conf complained 
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/owasp-webscarab
./owasp-webscarab.sh
#cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/proxystrike
#./proxystrike.sh # complains openssl 1.1.0 which does not really work on the setup- breaks all sorts of things.
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/pyfiscan
./pyfiscan.sh #PIP dependency  - needs check - 
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/sn1per
./sn1per.sh # check plugin errors  /usr/share/sniper/plugins/Findsploit/: No such file or directory
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/sparta
./sparta.sh  # 
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/v3n0m-scanner
./v3n0m-scanner.sh #PIP dependencies - 
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/vbscan
./vbscan.sh 
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/w3af
./w3af.sh
#cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/wapiti
#./wapiti.sh # did not work but worked prev.ubu1604_4.8.0-53-generic_04-06-2017 
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/whatweb
./whatweb.sh 
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/wpscan
#./wpscan.sh ruby app - see readme - rbenv shell doesent work yet
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/zaproxy
./zaproxy.sh # requires userinput during setup - check that again
#
###############################################################################
######################   2.Cisco-Tools   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/2.Cisco-Tools/cisco-auditing-tool
./cisco-auditing-tool.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/2.Cisco-Tools/cisco-global-exploiter
./cisco-global-exploiter.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/2.Cisco-Tools/cisco-ocs
##cisco-ocs.sh #greyd out earl, no idea why
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/2.Cisco-Tools/cisco-torch
##cisco-torch.sh #greyd out earl, no idea why
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/2.Cisco-Tools/copy-router-config
#./copy-router-config.sh #stopped working somehow,chk bk ltr.
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/2.Cisco-Tools/yersinia
./yersinia.sh  - wild building lots warnings.

###############################################################################
######################   3.LFI-RFI   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/3.LFI-RFI/fimap
./fimap.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/3.LFI-RFI/kadabra
./kadabra.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/3.LFI-RFI/kadimus
./kadimus.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/3.LFI-RFI/lfifreak
./lfifreak.sh
cd /opt/ITSEC-Install-Scripts/2.Vulnerability-Scanner/3.LFI-RFI/liffy
./liffy.sh # runs BUT: AttributeError: 'NoneType' object has no attribute 'find'
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

