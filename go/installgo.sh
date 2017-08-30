#!/bin/sh
v="1.9"
cd ~
wget "https://storage.googleapis.com/golang/go${v}.linux-amd64.tar.gz"  --progress=bar:force 2>&1 &&\
tar xzvf "go${v}.linux-amd64.tar.gz"  &&\
mv go  /opt/go &&\
mkdir -p /GOPATH &&\
echo "export GOROOT=/opt/go" >>/etc/profile  &&\
echo "export GOPATH=/GOPATH" >>/etc/profile  &&\
echo "export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/go/bin" >>/etc/profile
