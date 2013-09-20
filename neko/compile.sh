# Packaging for neko
tar xvzf neko-2.0.0-linux.tar.gz

# File system structure
mkdir /tmp/neko
mkdir -p /tmp/neko/usr/local/bin
cp ./neko-2.0.0-linux/neko /tmp/neko/usr/local/bin
cp ./neko-2.0.0-linux/nekoc /tmp/neko/usr/local/bin
cp ./neko-2.0.0-linux/nekotools /tmp/neko/usr/local/bin

mkdir -p /tmp/neko/usr/local/lib
cp ./neko-2.0.0-linux/*.so /tmp/neko/usr/local/lib

mkdir -p /tmp/neko/usr/local/lib/neko
cp -r ./neko-2.0.0-linux/* /tmp/neko/usr/local/lib/neko

# Packaging
mksquashfs /tmp/neko neko.tcz
