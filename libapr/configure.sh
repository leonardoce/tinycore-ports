tar xvf apr-1.4.8.tar.bz2

cd apr-1.4.8
./configure --prefix=/usr/local
make -j3
make DESTDIR=/tmp/libapr install
cd ..

mksquashfs /tmp/libapr libapr.tcz