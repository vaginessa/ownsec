#!/bin/bash

BASEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access
###############################################################################
######################   9.Maintain-Access   ####################
###########################################################################
# 1.OS-Backdoors
cd $BASEDIR/1.OS-Backdoors/0.MultiOS-Backdoor/phantom-evasion
./phantom-evasion-install
cd $BASEDIR/1.OS-Backdoors/0.MultiOS-Backdoor/pupy
./pupy-install.sh
cd $BASEDIR/1.OS-Backdoors/0.MultiOS-Backdoor/the-backdoor-factory
./the-backdoor-factory-install.sh 
cd $BASEDIR/1.OS-Backdoors/0.MultiOS-Backdoor/thefatrat
./thefatrat-install.sh #appears to work - check again - on 2nd test [ x ] Aapt v0.2-3821160 
cd $BASEDIR/1.OS-Backdoors/0.MultiOS-Backdoor/pupy
./pupy-install.sh
cd $BASEDIR/1.OS-Backdoors/0.MultiOS-Backdoor/veil-evasion
#./veil-evasion-install.sh
cd $BASEDIR/1.OS-Backdoors/0.MultiOS-Backdoor/webacoo
./webacoo-install.sh 

#cd $BASEDIR/2.Generate/1.OS-Backdoors/ares
#./ares-install.sh
cd $BASEDIR/1.OS-Backdoors/2.Win-Backdoor/dr0p1t-framework
./Dr0p1t-Framework-install.sh
cd $BASEDIR/1.OS-Backdoors/3.Mac-Backdoor/bella
./bella-install.sh

# 99.Misc
cd $BASEDIR/99.Misc/exe2hex
./exe2hex-install.sh

# ..../3.Rootkit/1.Kernel/1.Linux/
# clone repos

# KERNEL
mkdir -p /opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Linux

cd $BASEDIR/3.Rootkit/1.Linux/diamorphine
./Diamorphine_gitclone.sh
cd $BASEDIR/3.Rootkit/1.Linux/mak_it-Linux-Rootkit
./maK_it-Linux-Rootkit_gitclone.sh
cd $BASEDIR/3.Rootkit/1.Linux/puszek-rootkit
./puszek-rootkit_gitclone.sh
cd $BASEDIR/3.Rootkit/1.Linux/reptile
./Reptile_gitclone.sh
cd $BASEDIR/3.Rootkit/1.Linux/rootkit/ah450
./rootkit_gitclone.sh
cd $BASEDIR/3.Rootkit/1.Linux/rootkit/narupo
./rootkit_gitclone.sh
cd $BASEDIR/3.Rootkit/1.Linux/Rootkit/RagingGrim
./Rootkit_gitclone.sh
cd $BASEDIR/3.Rootkit/1.Linux/vlany/mempodippy
./vlany_gitclone.sh

# PHP
mkdir -p /opt/ITSEC/9.Maintain-Access/2.PHP
cd $BASEDIR/2.PHP/php-rootkit/Paradoxis
./PHP-Rootkit_gitclone.sh

