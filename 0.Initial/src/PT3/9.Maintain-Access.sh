#!/bin/bash

###############################################################################
######################   9.Maintain-Access   ####################
###########################################################################

cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/2.Generate/l0l
./l0l.sh
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/2.Generate/owasp-zsc
./owasp-zsc.sh
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/2.Generate/shellnoob
./shellnoob.sh # exec w snoob 
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/2.Generate/the-backdoor-factory
./the-backdoor-factory.sh 
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/2.Generate/thefatrat
./thefatrat.sh #appears to work - check again - on 2nd test [ x ] Aapt v0.2-3821160 
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/2.Generate/veil-evasion
#./veil-evasion.sh
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/2.Generate/webacoo
./webacoo.sh 

# 1.OS-Backdoors/3.Botnet
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/2.Generate/1.OS-Backdoors/ares
./ares.sh
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/1.OS-Backdoors/2.Win/Dr0p1t-Framework
./Dr0p1t-Framework.sh
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/2.Generate/1.OS-Backdoors/3.Mac/bella
./bella.sh

