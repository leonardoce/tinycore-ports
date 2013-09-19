# Scomprimo tutto
tar xvf wine-1.5.22.tar.bz2
cd wine-1.5.22

# Compilo

tce-load -i libxml2
tce-load -i ncurses-dev
tce-load -i gettext
tce-load -i gtk2-dev

./configure --prefix=/usr/local
make -j3
make DESTDIR=/tmp/wine install

# Impacchetto
cd ..
mksquashfs /tmp/wine wine.tcz