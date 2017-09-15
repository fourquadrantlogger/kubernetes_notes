#!/bin/sh
cd ~

wget https://artifacts.elastic.co/downloads/kibana/kibana-6.0.0-beta2-linux-x86_64.tar.gz --progress=bar:force 2>&1
tar xzvf kibana-6.0.0-beta2-linux-x86_64.tar.gz
mv kibana-6.0.0-beta2-linux-x86_64 /opt
rm kibana-6.0.0-beta2-linux-x86_64.tar.gz
cd opt/kibana-6.0.0-beta2-linux-x86_64
