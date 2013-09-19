# Expands the archive
tar xvzf geeqie-1.1.tar.gz
cd geeqie-1.1

# Configure and compile
tce-load -i intltool

./configure --prefix=/usr/local
make -j3
make DESTDIR=/tmp/geeqie install

# Preparo il file desktop
echo X-FullPathIcon=/usr/local/share/pixmaps/geeqie.png >> /tmp/geeqie/usr/local/share/applications/geeqie.desktop

# Impacchetto
cd ..
mksquashfs /tmp/geeqie geeqie.tcz