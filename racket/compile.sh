. ../functions.sh

tar xvf racket-5.3.6-src-unix.tgz

tce-load -i wxwidgets-2.8.tcz
tce-load -i wxwidgets-contrib-2.8.tcz

cd racket-5.3.6/src
compile_autotools
cd ../../

mkquashfs /tmp/compile_temp racket.tcz
