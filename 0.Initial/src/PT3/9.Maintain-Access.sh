#!/bin/bash

###############################################################################
######################   9.Maintain-Access   ####################
###########################################################################

cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/2.Generate/


./l0l.sh
./owasp-zsc.sh
./shellnoob.sh # exec w snoob 
./the-backdoor-factory.sh 
./thefatrat.sh #appears to work - check again - on 2nd test [ x ] Aapt v0.2-3821160 
#./veil-evasion.sh
./webacoo.sh 
# 1.OS-Backdoors/3.Botnet
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/2.Generate/1.OS-Backdoors
./ares.sh
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/2.Generate/1.OS-Backdoors/3.Mac
./bella.sh