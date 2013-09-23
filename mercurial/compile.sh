# Uncompress
tar xvzf mercurial-2.7.1.tar.gz

# Compiling
cd mercurial-2.7.1
tce-load -i python
tce-load -i python-dev
python setup.py build
python setup.py install --root=/tmp/mercurial

# Packaging
cd ..
mksquashfs /tmp/mercurial mercurial.tcz