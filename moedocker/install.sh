wget https://tukaani.org/xz/xz-5.2.4.tar.gz
tar xzvf xz-5.2.4.tar.gz
cd  xz
./configure --prefix=/opt/gnu/xz
make
make install
ln -s /opt/gnu/xz/bin/xz /bin/xz