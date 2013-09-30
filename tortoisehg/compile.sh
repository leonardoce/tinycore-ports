tar xvf tortoisehg-2.9.1.tar.gz

cd tortoisehg-2.9.1
python setup.py build
python setup.py install --root=/tmp/tortoisehg

cd ..
mksquashfs /tmp/tortoisehg tortoisehg.tcz
