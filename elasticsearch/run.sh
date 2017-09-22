#!/usr/bin/env bash

mkdir -p /data/elasticsearch/data
mkdir -p /data/elasticsearch/plugins
mkdir -p /data/elasticsearch/logs

chown -R 1000 /data/elasticsearch

cp -r config /data/elasticsearch/
docker rm -f ES
docker run --user elasticsearch  \
--name ES \
-v /data/elasticsearch/config:/opt/elasticsearch/config \
-v /data/elasticsearch/data:/opt/elasticsearch/data \
-v /data/elasticsearch/logs:/opt/elasticsearch/logs \
-v /data/elasticsearch/plugins:/opt/elasticsearch/plugins \
-p 9200:9200 \
-p 9300:9300 \
--net=host \
-d timeloveboy/elasticsearch

docker ps -a