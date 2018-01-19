
make -j 2
cd ../../hostapd-wpe/certs
./bootstrap

cd ../../hostapd-2.2/hostapd
sudo ./hostapd-wpe hostapd-wpe.conf