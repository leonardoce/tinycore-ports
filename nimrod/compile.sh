# Packaging nimrod
unzip nimrod_0.9.2.zip

# Compiling
cd nimrod
sh ./build.sh
bin/nimrod c koch
./koch boot -d:release
cd ..

# Packaging
mkdir -p /tmp/nimrod/usr/local/bin
rm -rf nimrod/build
cp -r nimrod /tmp/nimrod/usr/local/nimrod
ln -s /usr/local/nimrod/bin/nimrod /tmp/nimrod/usr/local/bin/nimrod
mksquashfs /tmp/nimrod nimrod.tcz