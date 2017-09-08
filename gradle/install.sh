#!/bin/sh
v="4.1"
cd ~
mkdir -p /opt/gradle
wget "https://services.gradle.org/distributions/gradle-${v}-bin.zip"  --progress=bar:force 2>&1 &&\
unzip "gradle-${v}-bin.zip"  &&\
mv "gradle-${v}"  /opt/gradle &&\
echo "export GRADLE=/opt/gradle/gradle-${v}/bin" >>/etc/profile  &&\
echo "export PATH=$PATH:$GRADLE/bin" >>/etc/profile
