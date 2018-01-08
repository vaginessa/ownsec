This page is an indication only and may be behind the actual routine, check the linked scripts / dirs for changes.

> # Part 3 
> ## The following applications are being installed in part 3

> location of the part 3 scripts is /opt/ownsec/0.Initial/src/PT3 && && https://github.com/alphaaurigae/ownsec/tree/master/0.Initial/src/PT3

> - the setup script running those is located here: /opt/ownsec/0.Initial/2.sh && https://github.com/alphaaurigae/ownsec/blob/master/0.Initial/3.sh

> some installscripts may be broken, incomplete and/or disabled. 
> disabled scripts are marked with `#` or have a disabled note. ex "xplico https://github.com/xplico/xplico.git # disabled"

## 1.Information-Gathering

### .../1.Information-Gathering/1.Network_Portscanner
* masscan https://github.com/robertdavidgraham/masscan.git <br />
* nmap https://github.com/nmap/nmap.git
* spiderfoot https://github.com/smicallef/spiderfoot.git
* thanos https://github.com/P0cL4bs/Thanos.git
* xplico https://github.com/xplico/xplico.git # disabled
* zmap https://github.com/zmap/zmap.git


### .../1.Information-Gathering/2.Live-Host 
* arping https://github.com/ThomasHabets/arping.git
* dmitry https://github.com/jaygreig86/dmitry.git
* fping https://github.com/schweikert/fping.git
* hping https://github.com/antirez/hping.git
* netdiscover https://github.com/alexxy/netdiscover.git
* recon-ng https://bitbucket.org/LaNMaSteR53/recon-ng.git
* wol-e git://git.kali.org/packages/wol-e.git

#### .../1.Information-Gathering/2.Live-Host/1.Cloudflare
* cloud-buster https://github.com/SageHack/cloud-buster.git
#### .../1.Information-Gathering/2.Live-Host/2.VPN
* ike-scan https://github.com/royhills/ike-scan.git
#### .../1.Information-Gathering/2.Live-Host/3.IPv6
* thc-ipv6 https://github.com/vanhauser-thc/thc-ipv6.git
#### .../1.Information-Gathering/2.Live-Host/4.Load-Balancer
* lbd git://git.kali.org/packages/lbd.git

### .../1.Information-Gathering/3.Route-Analysis
* 0trace https://github.com/BlackArch/0trace.git
* intrace https://github.com/robertswiecki/intrace.git
* irpas http://www.phenoelit.org/irpas

#### .../1.Information-Gathering/3.Route-Analysis/1.Cloudflare
* bypasscf https://github.com/HackerOrientado/BypassCF.git

#### .../1.Information-Gathering/4.SSL
* sslcaudit https://github.com/grwl/sslcaudit.git
* sslstrip2 https://github.com/byt3bl33d3r/sslstrip2.git # disabled
* sslyze_nabla_c0d3 https://github.com/nabla-c0d3/sslyze.git
* tlsprober https://github.com/WestpointLtd/tls_prober.git

#### .../1.Information-Gathering/5.DNS
* dnsenum https://github.com/fwaeytens/dnsenum.git
* dnsmap https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/dnsmap/dnsmap-0.30.tar.gz
* dnsrecon https://github.com/darkoperator/dnsrecon.git
* dnstracer https://github.com/pcoder/DNSTracer.git
* fierce https://github.com/mschwager/fierce.git
* passivedns https://github.com/gamelinux/passivedns.git

#### .../1.Information-Gathering/6.SMB
* accceck https://labs.portcullis.co.uk/download/acccheck-0-2-1.tar.gz
* enum4linux https://github.com/portcullislabs/enum4linux.git
* nbtscan http://www.unixwiz.net/tools/nbtscan-source-1.0.35.tgz
* smbmap https://github.com/ShawnDEvans/smbmap.git # disabled

#### .../1.Information-Gathering/7.SMTP
* smtp-userenum https://github.com/pentestmonkey/smtp-user-enum.git
* swaks https://github.com/roman-rybalko/swaks.git

#### .../1.Information-Gathering/8.SNMP
* braa https://github.com/mteg/braa.git
* snmp-check # disabled

#### .../1.Information-Gathering/11.Dork
* bingoo https://github.com/Hood3dRob1n/BinGoo.git
* scanner-inurlbr https://github.com/googleinurl/SCANNER-INURLBR.git

#### .../1.Information-Gathering/12.Scrape
* httrack https://github.com/xroche/httrack # disabled, installed w apt

#### .../1.Information-Gathering/13.OSINT
* cewl https://github.com/crunchsec/cewl # disabled
* creepy https://github.com/ilektrojohn/creepy # disabled
* datasploit https://github.com/DataSploit/datasploit.git
* maltegoce https://www.paterva.com/malv4/community # disabled
* metagoofil https://github.com/opsdisk/metagoofil.git
* tekdefense-automater https://github.com/1aN0rmus/TekDefense-Automater.git
* theharvester https://github.com/laramies/theHarvester.git
* twofi https://github.com/digininja/twofi.git
* urlcrazy https://github.com/hardwaterhacker/URLCrazy.git


#### .../1.Information-Gathering/14.Web-Firewalls
* wafw00f https://github.com/EnableSecurity/wafw00f.git

#### .../1.Information-Gathering/15.Fuzzer
* dirb https://github.com/seifreed/dirb.git # disabled
* dirbuster-ng https://github.com/digination/dirbuster-ng
* dotdotpwn https://github.com/wireghoul/dotdotpwn.git
* pydirbuster https://github.com/DominikSchlecht/pyDirBuster # disabled
* simplefuzzer https://github.com/orgcandman/simple-fuzzer.git
* siparmyknife https://github.com/foreni-packages/siparmyknife.git
* subbrute https://github.com/TheRook/subbrute # disabled
* sublist3r https://github.com/aboul3la/Sublist3r # disabled

#### .../1.Information-Gathering/16.IDS-IPS_Identification
* fir https://github.com/certsocietegenerale/FIR.git # disabled
* ftester https://github.com/inversepath/ftester.git


## 2.Vulnerability-Scanner
* arachni https://github.com/Arachni/arachni.git
* atscan https://github.com/AlisamTechnology/atscan.git
* ava https://github.com/SafeStack/ava.git
* bed git://git.kali.org/packages/bed.git
* blindelephant https://github.com/lokifer/BlindElephant.git
* commix https://github.com/commixproject/commix.git
* d-tect https://github.com/shawarkhanethicalhacker/D-TECT.git
* golismero https://github.com/golismero/golismero.git
* hellraiser https://github.com/m0nad/hellraiser.git
* joomscan https://github.com/rezasp/joomscan.git
* lhf https://github.com/blindfuzzy/LHF.git
* lightbulb-framework https://github.com/lightbulb-framework/lightbulb-framework.git
* lynis https://github.com/CISOfy/lynis.git
* nikto https://github.com/sullo/nikto.git
* openvas-setup-files http://www.openvas.org/download.html 
* owasp-webscarab https://github.com/OWASP/OWASP-WebScarab.git
* proxystrike https://github.com/sechacking/proxystrike.git
* pyfiscan https://github.com/fgeek/pyfiscan.git
* sn1per https://github.com/1N3/sn1per.git
* sparta https://github.com/SECFORCE/sparta.git
* v3n0m-scanner https://github.com/v3n0m-scanner/V3n0M-Scanner.git
* vbscan https://github.com/rezasp/vbscan.git
* w3af https://github.com/andresriancho/w3af.git
* wapiti https://github.com/IFGHou/wapiti.git
* whatweb https://github.com/urbanadventurer/WhatWeb.git
* wordpress-exploit-framework https://github.com/rastating/wordpress-exploit-framework
* wpscan https://github.com/wpscanteam/wpscan.git
* zaproxy https://github.com/zaproxy/zaproxy.git

### .../2.Vulnerability-Scanner/2.Cisco-Tools
* cisco-auditing-tool https://github.com/foreni-packages/cisco-auditing-tool.git
* cisco-global-exploiter https://github.com/foreni-packages/cisco-global-exploiter.git
* cisco-ocs # disabled, no source
* cisco-torch https://github.com/foreni-packages/cisco-torch.git
* copy-router-config https://edgithub.com/gitpan/Cisco-CopyConfig # disabl
* yersinia https://github.com/tomac/yersinia.git

### .../2.Vulnerability-Scanner/3.LFI-RFI
* fimap https://github.com/kurobeats/fimap.git
* kadabra https://github.com/D35m0nd142/Kadabra.git
* kadimus https://github.com/P0cL4bs/Kadimus.git
* lfifreak https://github.com/OsandaMalith/lfifreak.git
* liffy https://github.com/hvqzao/liffy

### 3.Exploitation-Tools
* armitage https://github.com/rsmudge/armitage.git
* clusterd https://github.com/hatRiot/clusterd.git
* crackmapexec https://github.com/byt3bl33d3r/CrackMapExec.git
* dracmap https://github.com/Screetsec/Dracnmap.git
* evilgrade https://github.com/infobyte/evilgrade.git
* hakkuframework https://github.com/4shadoww/hakkuframework.git
* intersect https://github.com/deadbits/Intersect-2.5.git
* jboss-autopwn https://github.com/SpiderLabs/jboss-autopwn.git
* metasploit https://github.com/rapid7/metasploit-framework
* penbox https://github.com/x3omdax/PenBox.git
* pentest https://github.com/jivoi/pentest.git
* phpsploit https://github.com/nil0x42/phpsploit
* pocsuite https://github.com/knownsec/Pocsuite
* routersploit https://github.com/reverse-shell/routersploit
* spraywmi https://github.com/trustedsec/spraywmi.git
* tplmap https://github.com/epinna/tplmap.git
* websploit https://github.com/websploit/websploit.git
* zarp https://github.com/hatRiot/zarp

#### .../3.Exploitation-Tools/2.Search
* exploit-database https://github.com/offensive-security/exploit-database.git
* exploitdb https://github.com/mattoufoutu/exploitdb
* findsploit https://github.com/1N3/Findsploit.git
* searchsploit https://github.com/sygo/searchsploit.git

#### .../3.Exploitation-Tools/3.Shellcode-gen
* l0l https://github.com/m3pt0r/l0l
* owasp-zsc https://github.com/zscproject/OWASP-ZSC
* shellnoob https://github.com/reyammer/shellnoob

#### .../3.Exploitation-Tools/4.MSF_payload-generator
* libenom https://github.com/bounteous/libenom.git
* mpc https://github.com/g0tmi1k/mpc.git
* sharpmeter https://github.com/vvalien/sharpmeter.git

#### .../3.Exploitation-Tools/5.SE_Phishing
* beef https://github.com/beefproject/beef.git
* fiercephish https://github.com/Raikia/FiercePhish
* ghost-phisher https://github.com/savio-code/ghost-phisher.git
* phishing-frenzy https://github.com/pentestgeek/phishing-frenzy.git
* se-toolkit https://github.com/trustedsec/social-engineer-toolkit.git
* weeman https://github.com/alexmaloteaux/weeman.git


## 4.Password
### .../4.Password/1.Network
* brut3k1t/ex0dus-0x/brut3k1t
* brutex https://github.com/1N3/BruteX
* f-scrack https://github.com/zgwdg/F-Scrack.git
* findmyhash https://github.com/frdmn/findmyhash.git
* hexorbase https://github.com/frdmn/findmyhash.git
* keimpx https://github.com/frdmn/findmyhash.git
* medusa https://github.com/jmk-foofus/medusa.git
* ncrack https://github.com/nmap/ncrack.git
* onesixtyone https://github.com/trailofbits/onesixtyone.git
* patator https://github.com/lanjelot/patator.git
* thc-hydra https://github.com/vanhauser-thc/thc-hydra.git
* thc-pptp-bruter https://github.com/BlackArch/thc-pptp-bruter.git

### .../4.Password/2.Local

* HASHCAT https://github.com/hashcat/hashcat.git
* johnny https://github.com/shinnok/johnny.git
* https://github.com/magnumripper/JohnTheRipper.git
* ophcrack https://github.com/luisgg/ophcrack.git
* pack https://github.com/iphelix/pack.git
* pyrit https://github.com/JPaulMora/Pyrit.git
* rainbowcrack-ng https://github.com/kholia/rainbowcrack-ng.git

1.WEP_WPA
* cowpatty https://github.com/roobixx/cowpatty.git
2.NVIDIA-ONLY
* truecrack https://github.com/lvaccaro/truecrack

### .../4.Password/3.Wordlist
* crunch https://github.com/apache/crunch # installed with apt
* rsangler https://github.com/digininja/RSMangler


## 5.Database
### ../5.Database/1.SQL
* sqlmap https://github.com/sqlmapproject/sqlmap
* bbqsql https://github.com/Neohapsis/bbqsql # install buggy


## 6.Wireless
### .../6.Wireless/1.Wifi
* aircrack https://github.com/Ethical-H4CK3R/Aircrack
* aircrack-ng https://github.com/aircrack-ng/aircrack-ng
* airgeddon https://github.com/v1s1t0r1sh3r3/airgeddon
* atear https://github.com/NORMA-Inc/AtEar
* boopsuite https://github.com/MisterBianco/BoopSuite
* eapmd5pass # http://www.willhackforsushi.com/code/eapmd5pass/1.4/
* fern-wifi-cracker https://github.com/savio-code/fern-wifi-cracker
* fruitywifi https://github.com/xtr4nge/FruityWifi
* handshaker https://github.com/d4rkcat/HandShaker
* kismet https://github.com/kismetwireless/kismet
* wifi-pumpkin https://github.com/P0cL4bs/WiFi-Pumpkin
* wpa2-halfhandshake-crack https://github.com/dxa4481/WPA2-HalfHandshake-Crack

#### .../6.Wireless/1.Wifi/1.WPS
* bully https://github.com/aanarchyy/bully
* pixiewps https://github.com/wiire-a/pixiewps
* reaver-wps-fork-t6x https://github.com/t6x/reaver-wps-fork-t6x

#### .../6.Wireless/1.Wifi/2.Routerkeys
* routerkeygenpc https://github.com/routerkeygen/routerkeygenPC

#### .../6.Wireless/1.Wifi/3.Jammer
* mdk3-$BRANCH https://github.com/camerony/mdk3-master
* wifijammer https://github.com/DanMcInerney/wifijammer

#### .../6.Wireless/1.Wifi/4.Evil-Twin
* hostapd-mana https://github.com/sensepost/hostapd-mana # not installed
* hostapd-wpe https://github.com/OpenSecurityResearch/hostapd-wpe

### 4.Sdr
* gqrx # inst script missing 
#### 1.GSM
* gr-gsm https://github.com/ptrkrysik/gr-gsm
* kalibrate-rtl https://github.com/steve-m/kalibrate-rtl


## 7.Mitm
* bdfproxy https://github.com/secretsquirrel/BDFProxy
* bettercap https://github.com/evilsocket/bettercap
* cdpsnarf https://github.com/Zapotek/cdpsnarf
* det https://github.com/sensepost/DET
* dripcap https://github.com/dripcap/dripcap
* ettercap https://github.com/Ettercap/ettercap
* hexinject # script needs supdate
* hyperfox https://github.com/malfunkt/hyperfox
* mitmf https://github.com/byt3bl33d3r/MITMf
* mitmproxy # installed with apt - build fail 
* moloch https://github.com/aol/moloch
* morpheus https://github.com/r00t-3xp10it/morpheus
* netsniff-ng https://github.com/netsniff-ng/netsniff-ng
* nfspy https://github.com/bonsaiviking/NfSpy
* p0f https://github.com/p0f/p0f
* responder https://github.com/SpiderLabs/Responder
* sniffjoke https://github.com/vecna/sniffjoke
* sslsniff # incomplete
* sslsplit https://github.com/droe/sslsplit
* stenographer https://github.com/google/stenographer
* tcpflow https://github.com/simsong/tcpflow
* wireshark https://github.com/wireshark/wireshark

### .../7.Mitm/2.DNS
* dnschef https://github.com/iphelix/dnschef
### .../7.Mitm/3.VPN
* fiked https://github.com/droe/fiked

## 8.Tunnel

### .../8.Tunnel/1.Pivot
* 3proxy https://github.com/z3APA3A/3proxy
* pivoter https://github.com/trustedsec/pivoter

## 9.Maintain-Access
### .../9.Maintain-Access/1.OS-Backdoors
#### .../9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor
* ares https://github.com/sweetsoftware/ares
* custom-ssh-backdoor https://github.com/joridos/custom-ssh-backdoor/custom-ssh-backdoor
* pupy https://github.com/n1nj4sec/pupy
* the-backdoor-factory https://github.com/secretsquirrel/the-backdoor-factory
* thefatrat https://github.com/Screetsec/TheFatRat
* veil-evasion https://github.com/Veil-Framework/Veil-Evasion
* webacoo https://github.com/anestisb/WeBaCoo


#### .../9.Maintain-Access/1.OS-Backdoors/2.Win-Backdoor
* dr0p1t-framework https://github.com/D4Vinci/Dr0p1t-Framework

#### .../9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor
* bella https://github.com/Trietptm-on-Security/Bella

#### .../9.Maintain-Access/1.OS-Backdoors/4.Android
* evil-droid https://github.com/M4sc3r4n0/Evil-Droid

### .../9.Maintain-Access/99.Misc
* exe2hex https://github.com/g0tmi1k/exe2hex