# this script will transform an autotools
# package in a tiny core extension

compile_temp=/tmp/compile_temp
package_temp=/tmp/pkg_temp

package_autotools() {
    olddir=`pwd`
    cd $compile_temp
    find . | xargs file | grep "executable" | grep ELF | grep "not stripped" | cut -f 1 -d : | xargs strip --strip-unneeded 2> /dev/null || find . | xargs file | grep "shared object" | grep ELF | grep "not stripped" | cut -f 1 -d : | xargs strip -g 2> /dev/null
    cd $olddir

    # Package extension
    mkdir -p $package_temp/usr/local
    cp -R $compile_temp/usr/local/bin $package_temp/usr/local
    cp -R $compile_temp/usr/local/etc $package_temp/usr/local
    cp -R $compile_temp/usr/local/share $package_temp/usr/local
    cp -R $compile_temp/usr/local/lib $package_temp/usr/local
    rm $package_temp/usr/local/lib/*.a
    mksquashfs $package_temp $1.tcz > /dev/null

    rm -rf $compile_temp/usr/local/bin
    rm -rf $compile_temp/usr/local/etc
    rm -rf $compile_temp/usr/local/share

    # Manuals
    if [ -d $compile_temp/usr/local/info -o -d $compile_temp/usr/local/man ]
    then
        rm -rf $package_temp
        mkdir -p $package_temp/usr/local
        cp -Rf $compile_temp/usr/local/info $package_temp/usr/local
        cp -Rf $compile_temp/usr/local/man $package_temp/usr/local
        mksquashfs $package_temp $1-doc.tcz > /dev/null
        rm -rf $compile_temp/usr/local/info
        rm -rf $compile_temp/usr/local/man
    fi

    # Development
    if [ -d $compile_temp/usr/local/lib ]
    then
        cp -r $compile_temp/usr/local/lib $compile_temp/usr/local/lib2
        rm $compile_temp/usr/local/lib2/*.a
        rm -rf $compile_temp/usr/local/lib
        mv $compile_temp/usr/local/lib2 $compile_temp/usr/local/lib
    fi

    nFiles=`find $compile_temp -type f | wc -l`
    if [ $nFiles -gt 0 ]
    then
        mksquashfs $compile_temp $1-dev.tcz > /dev/null
    fi
}

compile_autotools() {
    current_prefix=$1
    if [ -z "$1" ]
    then
        current_prefix=/usr/local
    fi
    ./configure --prefix=$current_prefix $config_opts > /dev/null
    make -j3 > /dev/null || exit 1
    make install DESTDIR=$compile_temp > /dev/null
}

autotools_to_pkg() {

    # cleaning dust
    rm -rf $compile_temp
    rm -rf $package_temp

    # arguments check
    if [ -z $1 -o -z $2 ]
    then
        echo "usage: $0 <archive_name> <package_name>"
        exit 1
    fi

    if [ ! -f $1 ]
    then
        echo "$1 is not a file!"
        exit 1
    fi

    rm -f $2.tcz $2-doc.tcz $2-dev.tcz

    # read configure parameters
    config_opts=
    if [ -f $2.config_opts ]
    then
        config_opts=`cat $2.config_opts`
    fi

    # Expand
    directory=`tar tf $1 | head -1`
    rm -rf $directory

    tar xf $1 > /dev/null

    # Configure and compile
    cd $directory
    compile_autotools
    cd ..
    package_autotools $2
}
