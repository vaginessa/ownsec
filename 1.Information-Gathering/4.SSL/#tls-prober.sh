#unfinished
#!/bin/bash
mkdir -p /opt/ITSEC/1.Information-Gathering/4.SSL/tls_prober/WestpointLtd
cd /opt/ITSEC/1.Information-Gathering/4.SSL/tls_prober/WestpointLtd
git clone https://github.com/WestpointLtd/tls_prober.git

cd /opt/ITSEC/1.Information-Gathering/4.SSL/tls_prober/WestpointLtd/tls_prober

git clean -f
git pull

git submodule init
git submodule update --recursive


