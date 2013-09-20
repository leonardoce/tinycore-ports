# Expands the archive
tar xvf emacs-24.3.tar.xz
cd emacs-24.3

# Configure and compile
tce-load -i gtk2-dev
./configure --prefix=/usr/local --with-gif=no
make -j3
make DESTDIR=/tmp/emacs install

# Preparo il file desktop
echo X-FullPathIcon=/usr/local/share/icons/hicolor/128x128/apps/emacs.png >> /tmp/emacs/usr/local/share/applications/emacs.desktop

# Impacchetto
cd ..
mksquashfs /tmp/emacs emacs.tcz
