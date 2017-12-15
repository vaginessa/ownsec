#!/bin/bash

DSKTPFLS=$REPOROOT/0.Initial/usrlcl/.local/share/applications/Services
DSKTPFLSDEST=/home/$USER/.local/share/applications/Services
DSKTPFL=phpmyadmin.desktop
#sudo rm -f /etc/phpmyadmin/phpmyadmin.desktop
#sudo rm -f  /usr/share/applications/phpmyadmin.desktop
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL


