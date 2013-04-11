cd /tmp
hg clone https://code.google.com/p/vim/
cd vim
./configure \
    --enable-perlinterp \
    --enable-pythoninterp \
    --enable-rubyinterp \
    --enable-cscope \
    --enable-gui=auto \
    --enable-gtk2-check \
    --enable-gnome-check \
    --with-features=huge \
    --prefix=/usr \
    --with-x \
    --with-compiledby="Justin Donaldson <jdonaldson@salesforce.com>" \
    --with-python-config-dir=/usr/lib/python2.7/config/

make VIMRUNTIMEDIR=/usr/share/vim/vim73
make clean
sudo make install

