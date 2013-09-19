# This script will package Java ina TinyCoreLinux extension.
# Java would be installed in /usr/local/java, according to this link:
#
# http://www.java.com/en/download/help/linux_install.xml

# Uncompressing java
mkdir -p /tmp/java7/usr/local/java
tar xvzf jdk-7u40-linux-i586.tar.gz -C /tmp/java7/usr/local/java

# Creating symbolic links
mkdir -p /tmp/java7/usr/local/bin
ln -s /usr/local/java/jdk1.7.0_40/bin/java /tmp/java7/usr/local/bin/java

# Now let's create the extension
tce-load -i squashfs-tools-4.x.tcz
mksquashfs /tmp/java7 java7.tcz

