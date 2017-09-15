#!/usr/bin/env bash
cd ~
V=5.7
v=5.7.19
#wget --no-check-certificate \
#--no-cookies \
#--header "Cookie: oraclelicense=accept-securebackup-cookie"\
# https://dev.mysql.com/get/Downloads/MySQL-${V}/mysql-${v}-linux-glibc2.12-x86_64.tar.gz \
#--progress=bar:force 2>&1

tar zxvf mysql-${v}.tar.gz
cmake .
make
make install  DESTDIR="/opt/mysql"
mysql -V
rm -r mysql-${v}