# This is a script to build the Intel ACPI compiler,
# which is needed by VirtualBox

tar xvzf acpica-unix2-20130823.tar.gz

cd acpica-unix2-20130823
make OPT_CFLAGS=-O2
make DESTDIR=/tmp/acpica install
mkdir -p /tmp/acpica/usr/local/bin
mv /tmp/acpica/usr/bin/* /tmp/acpica/usr/local/bin
cd ..

rm acpica.tcz
mksquashfs /tmp/acpica acpica.tcz