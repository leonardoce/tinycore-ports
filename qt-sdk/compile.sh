# This will package a release of QT5 SDK
tar xvzf qt-everywhere-opensource-src-5.1.1.tar.gz

# Launch configure script
tce-load -i libGL-dev
# This will load all the X development files
lce-load -i gtk2-dev 
# This is needed by the install script
tce-load -i python

cd qt-everywhere-opensource-src-5.1.1

echo Starting QT configure script. Please choose the Open Source version
echo and accept the license if you want

./configure --prefix=/usr/local -qt-xcb

# Starting compilation process
make -j3
# Here we use the -j3 option because (don't know why) during
# the installation process the QT-SDK compiles the V8 Javascript
# VM
INSTALL_ROOT=/tmp/qt-sdk make install -j3

# Packaging
cd ..
mksquashfs /tmp/qt-sdk qt-sdk.tcz