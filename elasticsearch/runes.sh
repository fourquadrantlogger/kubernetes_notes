#!/usr/bin/env bash

mkdir -p /data/elasticsearch/data
mkdir -p /data/elasticsearch/plugin
mkdir -p /data/elasticsearch/logs
mkdir -p /data/elasticsearch/config
docker rm -f ES
docker run --user elasticsearch  \
--name ES \
-v /opt/elasticsearch/config:/data/elasticsearch/config \
-v /opt/elasticsearch/data:/data/elasticsearch/data \
-v /opt/elasticsearch/logs:/data/elasticsearch/logs \
-v /opt/elasticsearch/plugin:/data/elasticsearch/plugin \
-p 9200:9200 \
-p 9300:9300 \
--net=host   \
timeloveboy/elasticsearch