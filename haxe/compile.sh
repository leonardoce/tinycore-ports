# Packaging HAXE compiler
mkdir haxe
cd haxe
tar xvf ../haxe-3.0.0-linux32.tar.gz
cd ..

# Packaging
mkdir -p /tmp/haxe/usr/local/lib/haxe
mkdir -p /tmp/haxe/usr/local/bin
cp haxe/haxe /tmp/haxe/usr/local/bin
cp -r haxe/* /tmp/haxe/usr/local/lib/haxe

mksquashfs /tmp/haxe haxe.tcz