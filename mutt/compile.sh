# This script compile an extension for Mutt
tar xvzf mutt-1.5.21.tar.gz

tce-load -i perl5
tce-load -i libidn-dev
tce-load -i ncurses-dev
tce-load -i openssl-1.0.0-dev

cd mutt-1.5.21
./configure --prefix=/usr/local --with-homespool --enable-smtp --enable-imap --enable-pop --with-ssl
make || exit 1
make install DESTDIR=/tmp/mutt 
cd ..

rm -f mutt.tcz
mksquashfs /tmp/mutt mutt.tcz
