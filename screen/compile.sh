# Unpackage
tar xvzf screen-4.0.3.tar.gz

# Expand
cd screen-4.0.3
./configure --prefix=/usr/local
make
make install DESTDIR=/tmp/screen
mkdir -p /tmp/screen/usr/local/etc
install ./etc/etcscreenrc  /tmp/screen/usr/local/etc/screenrc
cd ..

# Package
oldpwd=`pwd`
cd /tmp/screen
rm -rf usr/local/info
rm -rf usr/local/man
find . | xargs file | grep "executable" | grep ELF | grep "not stripped" | cut -f 1 -d : | xargs strip --strip-unneeded 2> /dev/null || find . | xargs file | grep "shared object" | grep ELF | grep "not stripped" | cut -f 1 -d : | xargs strip -g 2> /dev/null

cd $oldpwd
mksquashfs /tmp/screen screen.tcz
rm -rf /tmp/screen