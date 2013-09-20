# Uncompress and do the packaging in a temporary directory
tar xvf go1.1.2.linux-386.tar.gz

mkdir -p /tmp/go/usr/local/bin
mv go /tmp/go/usr/local/go

# Create the links
for fname in `echo /tmp/go/usr/local/go/bin/*`
do
  bname=`basename $fname`
  ln -s /usr/local/go/bin/$bname /tmp/go/usr/local/bin/$bname
done

mksquashfs /tmp/go golang.tcz
