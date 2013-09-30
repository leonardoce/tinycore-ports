tar xvf QScintilla-gpl-2.7.2.tar.gz

cd QScintilla-gpl-2.7.2/Qt4Qt5
qmake qscintilla.pro
make -j3
make install INSTALL_ROOT=/tmp/qscintilla
cd ..
cd ..
mksquashfs /tmp/qscintilla qscintilla.tcz

# needed to compile python bindings
tce-load -i qscintilla.tcz

cd QScintilla-gpl-2.7.2/Python
python configure.py
make -j3
make install INSTALL_ROOT=/tmp/python-qscintilla
cd ..
cd ..
mksquashfs /tmp/python-qscintilla python-qscintilla.tcz
