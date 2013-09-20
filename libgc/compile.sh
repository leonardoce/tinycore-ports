# This script compiles and packages the Boehm Weiser GC1
tar xvf gc.tar.gz

# Compiling
cd gc-7.2
./configure --prefix=/usr/local
make -j3
make DESTDIR=/tmp/libgc install
cd ..

# Packaging
mksquashfs /tmp/libgc libgc.tcz
