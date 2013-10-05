# This script will create a package
# for the FreePascal compiler

rm -rf /tmp/freepascal/
rm -rf /tmp/freepascal_temp/

tar xvf freepascal.tar
mkdir /tmp/freepascal_temp/
mkdir -p /tmp/freepascal/usr/local/bin
mkdir -p /tmp/freepascal/usr/local/freepascal/doc
mkdir -p /tmp/freepascal/usr/local/freepascal/demo
tar xvf fpc-2.6.2.i386-linux/doc-pdf.tar.gz -C /tmp/freepascal/usr/local/freepascal/doc
tar xvf fpc-2.6.2.i386-linux/demo.tar.gz -C /tmp/freepascal/usr/local/freepascal/demo
tar xvf fpc-2.6.2.i386-linux/binary.i386-linux.tar -C /tmp/freepascal_temp/

for f in /tmp/freepascal_temp/*
do
    tar xvf $f -C /tmp/freepascal/usr/local/freepascal
done

# installing symlinks
ln -s /usr/local/freepascal/lib/fpc/2.6.2/ppc386 /tmp/freepascal/usr/local/freepascal/bin/ppc386
for f in /tmp/freepascal/usr/local/freepascal/bin/*
do
    ln -s /usr/local/freepascal/bin/`basename $f` /tmp/freepascal/usr/local/bin/`basename $f`
done

# generating config file when the package will be installed
mkdir -p /tmp/freepascal/usr/local/tce.installed
echo /usr/local/freepascal/lib/fpc/2.6.2/samplecfg  /usr/local/freepascal/lib/fpc/2.6.2/ /usr/local/etc/ > /tmp/freepascal/usr/local/tce.installed/freepascal
chmod +x /tmp/freepascal/usr/local/tce.installed/freepascal

# squashing fs
rm freepascal.tcz
mksquashfs /tmp/freepascal freepascal.tcz
