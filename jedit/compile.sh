# Jedit is a really good Java editor but doesn't have ZIP bundle,
# it has only  jar installer.
# To package it you should install jEdit to a location and then package
# it with this script

JEDIT_DIR=$1

if [ -z $1 ]
then
  echo You must specify the jEdit installation to package
  exit
fi

if [ ! -d $1 ]
then
  echo $1 is not a directory
  exit
fi

mkdir -p /tmp/jedit/usr/local/jedit
cp -r $1/* /tmp/jedit/usr/local/jedit
mkdir -p /tmp/jedit/usr/local/share/applications
cp jedit.desktop /tmp/jedit/usr/local/share/applications
mkdir -p /tmp/jedit/usr/local/share/pixmaps
cp $1/doc/jedit.png /tmp/jedit/usr/local/share/pixmaps

mksquashfs /tmp/jedit jedit.tcz