# RELEASE="neko-1.8.2"

# -------- User Configuration END ------------



mkdir -p /usr/local/src && cd /usr/local/src
rm -rf /usr/local/src/neko*
rm -rf /usr/local/neko
rm -rf /usr/local/bin/neko*

if [ $RELEASE ]; then
    wget "http://nekovm.org/_media/$RELEASE.tar.gz"
    tar xfvz $RELEASE.tar.gz
    cd $RELEASE
else
    #cvs -d:pserver:anonymous@cvs.motion-twin.com:/cvsroot login
    #cvs -d:pserver:anonymous@cvs.motion-twin.com:/cvsroot co neko
    svn co http://nekovm.googlecode.com/svn/trunk neko
    cd neko
fi

# build neko
make

# install neko
mkdir /usr/local/neko
cp bin/* /usr/local/neko
ln -s /usr/local/neko/neko* /usr/local/bin/
ln -s /usr/local/neko/libneko.so /usr/local/lib


# may be required if /usr/local/lib is not in your library search path
grep "/usr/local/lib" /etc/ld.so.conf || echo "/usr/local/lib" >> /etc/ld.so.conf
ldconfig

# setup environment variables for neko
grep "NEKOPATH" /etc/environment || echo "export NEKOPATH=/usr/local/neko" >> /etc/environment

