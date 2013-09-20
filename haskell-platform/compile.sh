# This script doesn't work on tinycore because
# I've not found a package who has libgmp.so.3 and
# the GHC compiler needs this file. I'm titubant of
# the need of a package for libgmp.so.3 so, for now,
# I stop working on this script

# This script will package the haskell platform
# within a tcz repository
tar xvf ghc-7.6.3-i386-unknown-linux.tar.bz2
tar xvf haskell-platform-2013.2.0.0.tar.gz 

# Load dependencies
tce-load -i gmp
tce-load -i gmp-dev

# Install GHC in a temporary location
cd ghc-7.6.3
./configure --prefix=/usr/local
make 
make DESTDIR=/tmp/haskell-platform install
cd ..

# Install the haskell platform
cd haskell-platform-2013.2.0.0
./configure --prefix=/usr/local
make 
make DESTDIR=/tmp/haskell-platform install
cd ..

# Packaging
mksquashfs /tmp/haskell-platform haskell-platform.tcz