tar xvf PyQt-x11-gpl-4.10.3.tar.gz

# Dipendenze di sviluppo
tce-load -i qt4-sdk.tcz

cd PyQt-x11-gpl-4.10.3
python configure-ng.py
make -j3
# Here pyuic4 is stripped.. by pyuic4 is a python script
# and should not be
make install DESTDIR=/tmp/pyqt4 INSTALL_ROOT=/tmp/pyqt4
cd ..

# Installazione
rm -rf pyqt4.tcz
mksquashfs /tmp/pyqt4 pyqt4.tcz