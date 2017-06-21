

mkdir -p /opt/ITSEC/7.Mitm/moloch/aol
cd /opt/ITSEC/7.Mitm/moloch/aol
git clone https://github.com/aol/moloch.git



does not work, build error

03:30 $ make -j 2
Making all in capture
make[1]: Entering directory '/opt/ITSEC/7.Mitm/7.Mitm/moloch/aol/moloch/capture'
gcc -c thirdparty/js0n.c -o thirdparty/js0n.o
gcc -ggdb -DNDEBUG -DHTTP_PARSER_STRICT=0 -DHTTP_PARSER_DEBUG=0 -g -O2 -c thirdparty/http_parser.c -o thirdparty/http_parser.o
gcc -c thirdparty/patricia.c -o thirdparty/patricia.o
gcc -fPIC -g -O2 -Wall -Wextra -D_GNU_SOURCE -c main.c db.c yara.c http.c config.c parsers.c plugins.c field.c trie.c writers.c writer-inplace.c writer-disk.c writer-null.c writer-simple.c readers.c reader-libpcap-file.c reader-libpcap.c reader-tpacketv3.c packet.c session.c molochmagic.c \
    -I/usr/include/pcap \
    -Ithirdparty -pthread -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include  \
    -DBUILD_VERSION='"v0.18.2-39-g7fda672"'
packet.c: In function ‘moloch_packet_gre4’:
packet.c:728:14: warning: variable ‘offset’ set but not used [-Wunused-but-set-variable]
     uint16_t offset = 0;
              ^~~~~~
gcc -rdynamic -ggdb main.o db.o yara.o http.o config.o parsers.o plugins.o field.o trie.o writers.o writer-inplace.o writer-disk.o writer-null.o writer-simple.o readers.o reader-libpcap-file.o reader-libpcap.o reader-tpacketv3.o packet.o session.o molochmagic.o -o moloch-capture \
            -u g_checksum_update -u g_hmac_update \
    -lpcap -lnl-genl-3 -lnl-3 \
    -lgio-2.0 -lgobject-2.0 -lgthread-2.0 -pthread -Wl,--export-dynamic -lgmodule-2.0 -pthread -lglib-2.0 -lGeoIP -lcurl -lnet -lrt -luuid -lpcre thirdparty/http_parser.o thirdparty/js0n.o thirdparty/patricia.o -ldl -lpthread -lssl -lcrypto \
    -lm -lresolv -lmagic -lffi -lz
/usr/bin/ld: warning: libssl.so.1.0.0, needed by /usr/lib/gcc/x86_64-linux-gnu/6/../../../x86_64-linux-gnu/libcurl.so, may conflict with libssl.so.1.1
/usr/bin/ld: warning: libcrypto.so.1.0.0, needed by /usr/lib/gcc/x86_64-linux-gnu/6/../../../x86_64-linux-gnu/libcurl.so, may conflict with libcrypto.so.1.1
yara.o: In function `moloch_yara_open':
/opt/ITSEC/7.Mitm/7.Mitm/moloch/aol/moloch/capture/yara.c:63: undefined reference to `yr_compiler_create'
/opt/ITSEC/7.Mitm/7.Mitm/moloch/aol/moloch/capture/yara.c:72: undefined reference to `yr_compiler_add_file'
yara.o: In function `moloch_yara_init':
/opt/ITSEC/7.Mitm/7.Mitm/moloch/aol/moloch/capture/yara.c:89: undefined reference to `yr_initialize'
yara.o: In function `moloch_yara_execute':
/opt/ITSEC/7.Mitm/7.Mitm/moloch/aol/moloch/capture/yara.c:117: undefined reference to `yr_rules_scan_mem'
yara.o: In function `moloch_yara_email_execute':
/opt/ITSEC/7.Mitm/7.Mitm/moloch/aol/moloch/capture/yara.c:123: undefined reference to `yr_rules_scan_mem'
yara.o: In function `moloch_yara_exit':
/opt/ITSEC/7.Mitm/7.Mitm/moloch/aol/moloch/capture/yara.c:130: undefined reference to `yr_rules_destroy'
/opt/ITSEC/7.Mitm/7.Mitm/moloch/aol/moloch/capture/yara.c:132: undefined reference to `yr_rules_destroy'
/opt/ITSEC/7.Mitm/7.Mitm/moloch/aol/moloch/capture/yara.c:135: undefined reference to `yr_compiler_destroy'
/opt/ITSEC/7.Mitm/7.Mitm/moloch/aol/moloch/capture/yara.c:137: undefined reference to `yr_compiler_destroy'
yara.o: In function `moloch_yara_open':
/opt/ITSEC/7.Mitm/7.Mitm/moloch/aol/moloch/capture/yara.c:79: undefined reference to `yr_compiler_get_rules'
yara.o: In function `moloch_yara_exit':
/opt/ITSEC/7.Mitm/7.Mitm/moloch/aol/moloch/capture/yara.c:138: undefined reference to `yr_finalize'
reader-libpcap-file.o: In function `reader_libpcapfile_opened':
/opt/ITSEC/7.Mitm/7.Mitm/moloch/aol/moloch/capture/reader-libpcap-file.c:451: undefined reference to `dlt_to_linktype'
reader-libpcap.o: In function `reader_libpcap_start':
/opt/ITSEC/7.Mitm/7.Mitm/moloch/aol/moloch/capture/reader-libpcap.c:113: undefined reference to `dlt_to_linktype'
collect2: error: ld returned 1 exit status
Makefile:36: recipe for target 'all' failed
make[1]: *** [all] Error 1
make[1]: Leaving directory '/opt/ITSEC/7.Mitm/7.Mitm/moloch/aol/moloch/capture'
Makefile:322: recipe for target 'all-recursive' failed
make: *** [all-recursive] Error 1
