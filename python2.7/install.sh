#!/bin/sh
pyversion="2.7.13"
apt-get install -y  --fix-missing gcc make
wget "https://www.python.org/ftp/python/${pyversion}/Python-${pyversion}.tgz"  --progress=bar:force 2>&1
tar xzvf Python-${pyversion}.tgz
rm -r Python-2.7.13.tgz
mv Python-${pyversion} /opt/Python-${pyversion}
cd /opt/Python-${pyversion}
pwd
ls
./configure
make install
ln -s /opt/Python-${pyversion}/python /usr/bin/python
python -V