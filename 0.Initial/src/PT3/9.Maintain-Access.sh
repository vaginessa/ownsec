#!/bin/bash

###############################################################################
######################   9.Maintain-Access   ####################
###########################################################################
# 1.OS-Backdoors
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/the-backdoor-factory
./the-backdoor-factory-install.sh 
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/thefatrat
./thefatrat-install.sh #appears to work - check again - on 2nd test [ x ] Aapt v0.2-3821160 
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/veil-evasion
#./veil-evasion-install.sh
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/webacoo
./webacoo-install.sh 
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/pupy
./pupy-install.sh

#cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/2.Generate/1.OS-Backdoors/ares
#./ares-install.sh
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/1.OS-Backdoors/2.Win-Backdoor/dr0p1t-framework
./Dr0p1t-Framework-install.sh
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella
./bella-install.sh


# 99.Misc
cd /opt/ITSEC-Install-Scripts/9.Maintain-Access/99.Misc/exe2hex
./exe2hex-install.sh


# ..../3.Rootkit/1.Kernel/1.Linux/
# clone repos

#KERNEL
mkdir -p /opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/

# m0nad/Diamorphine
mkdir -p /opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/diamorphine/m0nad/
cd /opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/diamorphine/m0nad/
git clone https://github.com/m0nad/Diamorphine

# maK-/maK_it-Linux-Rootkit
mkdir -p /opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/maK_it-Linux-Rootkit/maK-/
cd /opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/maK_it-Linux-Rootkit/maK-/
git clone https://github.com/maK-/maK_it-Linux-Rootkit

# Eterna1/puszek-rootkit
mkdir -p /opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/puszek-rootkit/Eterna1/
cd /opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/puszek-rootkit/Eterna1/
git clone https://github.com/Eterna1/puszek-rootkit

# f0rb1dd3n/Reptile
mkdir -p /opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/reptile/f0rb1dd3n/
cd /opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/reptile/f0rb1dd3n/
git clone https://github.com/f0rb1dd3n/Reptile

# ah450/rootkit
mkdir -p /opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/rootkit-ah450/ah450/
cd /opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/rootkit-ah450/ah450/
git clone https://github.com/ah450/rootkit

# nurupo/rootkit
mkdir -p /opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/rootkit-narupo/narupo/
cd /opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/rootkit-narupo/narupo/
git clone https://github.com/nurupo/rootkit

# RagingGrim/Rootkit
mkdir -p /opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/Rootkit-RagingGrim/RagingGrim/
cd /opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/Rootkit-RagingGrim/RagingGrim/
git clone https://github.com/RagingGrim/Rootkit

# mempodippy/vlany
mkdir -p /opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/vlany/mempodippy/
cd /opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/vlany/mempodippy/
git clone https://github.com/mempodippy/vlany

##########################

mkdir -p /opt/ITSEC/9.Maintain-Access/3.Rootkit/2.PHP/PHP-Rootkit

mkdir -p /opt/ITSEC/9.Maintain-Access/3.Rootkit/2.PHP/PHP-Rootkit/Paradoxis
cd /opt/ITSEC/9.Maintain-Access/3.Rootkit/2.PHP/PHP-Rootkit/Paradoxis
git clone https://github.com/Paradoxis/PHP-Rootkit