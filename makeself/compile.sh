sh makeself.run
mkdir -p /tmp/makeself/usr/local/bin
cp makeself-2.1.5/*.sh /tmp/makeself/usr/local/bin
mksquashfs /tmp/makeself makeself.tcz
