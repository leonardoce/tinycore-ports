tar xvf qt-creator-2.8.1-src.tar.gz

# Start compiling
cd qt-creator-2.8.1-src
qmake -r
make -j3
make INSTALL_ROOT=/tmp/qt-creator/usr/local install

# Desktop file
mkdir -p /tmp/qt-creator/usr/local/share/applications
cp qt-creator.desktop /tmp/qt-creator/usr/local/share/applications

# Package
mksquashfs /tmp/qt-creator qt-creator.tcz