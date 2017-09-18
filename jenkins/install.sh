#!/bin/sh
cd ~
wget https://mirrors.tuna.tsinghua.edu.cn/jenkins/war-stable/2.73.1/jenkins.war --progress=bar:force 2>&1
tar xzvf apache-maven-3.3.9-bin.tar.gz
mv apache-maven-3.3.9  /opt/maven
rm apache-maven-3.3.9-bin.tar.gz
echo "export M2_HOME=/opt/maven" >>/etc/profile
echo "export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/jdk8/bin:/opt/maven/bin" >>/etc/profile
