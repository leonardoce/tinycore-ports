. ../functions.sh

tce-load -i libapr-dev.tcz
tce-load -i libapr-util-dev.tcz

tar xvf httpd-2.4.6.tar.bz2
cd httpd-2.4.6
compile_autotools /usr/local/httpd
cd ..
mksquashfs /tmp/compile_temp httpd.tcz
