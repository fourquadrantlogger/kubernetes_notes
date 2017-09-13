#!/bin/sh
cd ~
wget http://mirrors.hust.edu.cn/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz --progress=bar:force 2>&1
tar xzvf apache-maven-3.3.9-bin.tar.gz
mv apache-maven-3.3.9  /opt/maven
rm apache-maven-3.3.9-bin.tar.gz
echo "export M2_HOME=/opt/maven" >>/etc/profile
echo "export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/jdk8/bin:/opt/maven/bin" >>/etc/profile
