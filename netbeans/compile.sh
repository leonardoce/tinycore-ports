# Netbeans is a really good Java ide but doesn't have ZIP bundle.
# To package it you should install it to a location and then package
# it with this script

NB_DIR=$1

if [ -z $1 ]
then
  echo You must specify the installation to package
  exit
fi

if [ ! -d $1 ]
then
  echo $1 is not a directory
  exit
fi

mkdir -p /tmp/netbeans/usr/local/netbeans
cp -r $1/* /tmp/netbeans/usr/local/netbeans
mkdir -p /tmp/netbeans/usr/local/share/applications
cp netbeans.desktop /tmp/netbeans/usr/local/share/applications
mkdir -p /tmp/netbeans/usr/local/share/pixmaps
cp $1/nb/netbeans.png /tmp/netbeans/usr/local/share/pixmaps

mksquashfs /tmp/netbeans netbeans.tcz