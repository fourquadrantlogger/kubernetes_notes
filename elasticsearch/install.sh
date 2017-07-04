#!/bin/bash
cd ~
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.1.2.tar.gz  --progress=bar:force 2>&1
tar xzvf elasticsearch-5.1.2.tar.gz
mv elasticsearch-5.1.2 /opt/elasticsearch
rm elasticsearch-5.1.2.tar.gz

# 新建用户
adduser elasticsearch
adduser elasticsearch sudo
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

elasticsearch -version
cat ~/good.txt
chmod -R 777 /opt/elasticsearch
su elasticsearch
cd /opt/elasticsearch