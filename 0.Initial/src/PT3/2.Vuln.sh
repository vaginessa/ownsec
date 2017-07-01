#!/bin/bash
###############################

#
###############################################################################
######################   1.Vulnerability-Scanner   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/1.Vulnerability-Scanner/openvas-setup-files
./openvas9-setup.sh  # disbbled to debug other scripts
#
#1.Vulnerability-Scanner ##########################################################
cd /opt/ITSEC-Install-Scripts/1.Vulnerability-Scanner/
./arachni.sh
./atscan.sh 
#./ava.sh #didnt work, dont remember why, checkin later.
./bed.sh 
./blindelephant.sh #console link has be called with - mark the capital B "Blindelephant.py
./commix.sh 
./d-tect.sh # (needs console linking through d-tect.sh)
./golismero.sh  
./hellraiser.sh #needs check - some sort of ruby clstrfk
./joomscan.sh 
./lhf.sh 
./lightbulb-framework.sh #PIP dependency  - needs check - 
./lynis.sh 
./nikto.sh #check nikto.conf complained 
./owasp-webscarab.sh 
#./proxystrike.sh # complains openssl 1.1.0 which does not really work on the setup- breaks all sorts of things.
./pyfiscan.sh #PIP dependency  - needs check - 
./sn1per.sh # check plugin errors  /usr/share/sniper/plugins/Findsploit/: No such file or directory
./sparta.sh  # ./sparta.sh: 11: ./sparta.sh: Syntax error: "(" unexpected - see also/opt/ITSEC-Install-Scripts/0.Initial/src/PT2/1.DEB-Lists.sh
./uniscan.sh # err: you may need to install the Uniscan::Crawler module)
./v3n0m-scanner.sh #PIP dependencies - 
./vbscan.sh 
#./w3af.sh
#./wapiti.sh # did not work but worked prev.ubu1604_4.8.0-53-generic_04-06-2017 
./whatweb.sh 
#./wpscan.sh ruby app - see readme - rbenv shell doesent work yet
./zaproxy.sh # requires userinput during setup - check that again
#
###############################################################################
######################   2.Cisco-Tools   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/2.Cisco-Tools/
./cisco-auditing-tool.sh 
./cisco-global-exploiter.sh 
##cisco-ocs.sh #greyd out earl, no idea why
##cisco-torch.sh #greyd out earl, no idea why
#./copy-router-config.sh #stopped working somehow,chk bk ltr. 
./yersinia.sh  - wild building lots warnings.
#
###############################################################################
######################   3.Fuzzer   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/3.Fuzzer/
./dotdotpwn.sh 
./simplefuzzer.sh # call w sfuzz 
./siparmyknife.sh 
#
t.sh 
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

