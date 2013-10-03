tar xvf bzr-2.6.0.tar.gz

tce-load -i python-dev

cd bzr-2.6.0
python setup.py build
python setup.py install --root=/tmp/bazaar
cd ..

mksquashfs /tmp/bazaar bazaar.tcz
