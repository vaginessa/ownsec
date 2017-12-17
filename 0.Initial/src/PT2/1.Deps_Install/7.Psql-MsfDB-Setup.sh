#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

POSTGRES_USER="postgres"
MSF_PASS=`cat /dev/urandom |base64 | head -c8`
POSTGRES_PASS=`cat /dev/urandom |base64 | head -c8`
PG_VER=`psql --version | awk '{print $3}' | cut -d. -f1,2`

echo "${bold}
 ____  ____   ___  _       __  __ ____  _____ 
|  _ \/ ___| / _ \| |     |  \/  / ___||  ___|
| |_) \___ \| | | | |     | |\/| \___ \| |_   
|  __/ ___) | |_| | |___  | |  | |___) |  _|  
|_|   |____/ \__\_\_____| |_|  |_|____/|_|    
             
Setup Metasploit-Framework database on PSQL
${normal}"

sudo ldconfig
sudo updatedb
#sudo xterm 

sudo service postgresql start
sudo service postgresql status

# Setup the DB without userinteraction - unattended so that the main script is not interrupted.
sudo -i -u $POSTGRES_USER << EOF
createuser msf || true
#psql -c "ALTER USER msf WITH ENCRYPTED PASSWORD 'msf';"
psql -c "ALTER USER msf WITH PASSWORD 'msf';"
createdb --owner=msf msf || true

#psql -c "ALTER USER $POSTGRES_USER WITH ENCRYPTED PASSWORD '$POSTGRES_PASS';"

#echo "host    all    postgres    127.0.0.1/32    md5" > "/etc/postgresql/$PG_VER/main/pg_hba.conf"
echo "host    msf    msf    127.0.0.1/32    md5" >> "/etc/postgresql/$PG_VER/main/pg_hba.conf"

#echo "localhost:5432:*:postgres:$POSTGRES_PASS" > ~/.pgpass
echo "localhost:5432:msf:msf:msf" >> ~/.pgpass
chmod 0600 ~/.pgpass

echo "listen_addresses = 'localhost'" >> "/etc/postgresql/$PG_VER/main/postgresql.conf"

exit
EOF

#sudo service postgresql restart