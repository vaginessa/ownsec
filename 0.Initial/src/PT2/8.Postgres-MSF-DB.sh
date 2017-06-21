#!/bin/bash
sudo ldconfig
sudo updatedb
#sudo xterm 


sudo systemctl enable postgresql
sudo systemctl start postgresql

POSTGRES_USER="postgres"
MSF_PASS=`cat /dev/urandom |base64 | head -c8`
POSTGRES_PASS=`cat /dev/urandom |base64 | head -c8`

PG_VER=`psql --version | awk '{print $3}' | cut -d. -f1,2`
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



sudo systemctl restart postgresql