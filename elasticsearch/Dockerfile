FROM timeloveboy/jdk8
MAINTAINER timeloveboy(734991033@qq.com)

ENV ES_HOME /opt/elasticsearch
ENV PATH $PATH:$ES_HOME/bin
VOLUME ["/elasticsearch/config"]
VOLUME ["/escluster"]
# 容器需要开放ES的9200和9300端口
EXPOSE 9200
EXPOSE 9300
CMD bin/elasticsearch
