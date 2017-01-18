#!/bin/sh 
sudo docker run -it -p 10022:22 -v /CODE/code.aliyun.com/docker-res/hadoop2.7.3/etc/hadoop:/opt/hadoop/etc/hadoop -v /media/paidian/DATA/hdfs:/opt/hadoop/hdfs timeloveboy/hadoop
