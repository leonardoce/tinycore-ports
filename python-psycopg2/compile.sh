tar xvf psycopg2-2.5.1.tar.gz

cd psycopg2-2.5.1
tce-load -i python
tce-load -i python-dev
python setup.py build
python setup.py install --root=/tmp/psycopg

# Packaging
cd ..
mksquashfs /tmp/psycopg psycopg.tcz
