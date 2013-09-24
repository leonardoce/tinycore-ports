# Uncompress
tar xvf sip-4.15.2.tar.gz

# Build deps
tce-load -i python-dev

# Build
cd sip-4.15.2
python configure.py
make
rm -rf /tmp/sip
make install DESTDIR=/tmp/sip
cd ..

# Package
rm sip.tcz
mksquashfs /tmp/sip sip.tcz
rm -rf /tmp/sip