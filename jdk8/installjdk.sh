#!/bin/sh
cd ~

wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz --progress=bar:force 2>&1
tar xzvf jdk-8u131-linux-x64.tar.gz
mv jdk1.8.0_131 /opt/jdk8
rm jdk-8u131-linux-x64.tar.gz
echo "export JAVA_HOME=/opt/jdk8" >>/etc/profile
echo "export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/jdk8/bin" >>/etc/profile