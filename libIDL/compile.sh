# libIDL package
tar xvf libIDL-0.8.14.tar.bz2

# Compiling
tce-load -i glib2-dev 
cd libIDL-0.8.14
./configure --prefix=/usr/local
make install
make install DESTDIR=/tmp/libIDL
cd ..

# Packaging
rm libIDL.tcz
mksquashfs /tmp/libIDL libIDL.tcz
rm -rf /tmp/libIDL