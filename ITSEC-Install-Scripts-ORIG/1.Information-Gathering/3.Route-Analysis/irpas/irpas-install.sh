#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

echo "${bold}
 ___ ____  ____   _    ____  
|_ _|  _ \|  _ \ / \  / ___| 
 | || |_) | |_) / _ \ \___ \ 
 | ||  _ <|  __/ ___ \ ___) |
|___|_| \_\_| /_/   \_\____/ 
          
${normal}"

reporoot=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/irpas/phenoelit.org
irpas=irpas_0.10
irpasurl=http://www.phenoelit.org/irpas/irpas_0.10.tar.gz
#for bin in dhcpx itrace tctrace ass file2cable dfkaa cdp hsrp icmp_redirect igrp irdp irdpresponder netenum netmask protos timestamp
#do sudo rm /usr/local/bin/irpas-$bindone

#
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/3.Route-Analysis/irpas
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/3.Route-Analysis/irpas
DSKTPFL1=irpas-dhcpx.desktop
DSKTPFL2=irpas-itrace.desktop
DSKTPFL3=irpas-tctrace.desktop
DSKTPFL4=irpas-ass.desktop
DSKTPFL5=irpas-file2cable.desktop
DSKTPFL6=irpas-dfkaa.desktop
DSKTPFL7=irpas-cdp.desktop
DSKTPFL8=irpas-hsrp.desktop
DSKTPFL9=irpas-icmp_redirect.desktop
DSKTPFL10=irpas-igrp.desktop
DSKTPFL11=irpas-irdp.desktop
DSKTPFL12=irpas-irdpresponder.desktop
DSKTPFL13=irpas-netenum.desktop
DSKTPFL14=irpas-netmask.desktop
DSKTPFL15=irpas-protos.desktop
DSKTPFL16=irpas-timestamp.desktop

rm -f $DSKTPFLSDEST/irpas-*

mkdir -p $reporoot
cd $reporoot

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

wget $irpasurl
tar xvfz $irpas.tar.gz
sudo rm -r $irpas.tar.gz
cd $irpas
make -j 4
for bin in dhcpx itrace tctrace ass file2cable dfkaa cdp hsrp icmp_redirect igrp irdp irdpresponder netenum netmask protos timestamp do sudo ln -s $reporoot/$irpas/$bin /usr/local/bin/irpas-$bindone
#
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2
cp $DSKTPFLS/$DSKTPFL3 $DSKTPFLSDEST/$DSKTPFL3
cp $DSKTPFLS/$DSKTPFL4 $DSKTPFLSDEST/$DSKTPFL4
cp $DSKTPFLS/$DSKTPFL5 $DSKTPFLSDEST/$DSKTPFL5
cp $DSKTPFLS/$DSKTPFL6 $DSKTPFLSDEST/$DSKTPFL6
cp $DSKTPFLS/$DSKTPFL7 $DSKTPFLSDEST/$DSKTPFL7
cp $DSKTPFLS/$DSKTPFL8 $DSKTPFLSDEST/$DSKTPFL8
cp $DSKTPFLS/$DSKTPFL9 $DSKTPFLSDEST/$DSKTPFL9
cp $DSKTPFLS/$DSKTPFL10 $DSKTPFLSDEST/$DSKTPFL10
cp $DSKTPFLS/$DSKTPFL11 $DSKTPFLSDEST/$DSKTPFL11
cp $DSKTPFLS/$DSKTPFL12 $DSKTPFLSDEST/$DSKTPFL12
cp $DSKTPFLS/$DSKTPFL13 $DSKTPFLSDEST/$DSKTPFL13
cp $DSKTPFLS/$DSKTPFL14 $DSKTPFLSDEST/$DSKTPFL14
cp $DSKTPFLS/$DSKTPFL15 $DSKTPFLSDEST/$DSKTPFL15
cp $DSKTPFLS/$DSKTPFL16 $DSKTPFLSDEST/$DSKTPFL16
sudo updatedb
