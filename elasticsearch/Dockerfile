FROM timeloveboy/jdk8
MAINTAINER timeloveboy(734991033@qq.com)
ADD install.sh install.sh
RUN sh install.sh
ENV ES_HOME /opt/elasticsearch
ENV PATH $PATH:$ES_HOME/bin

# 容器需要开放ES的9200和9300端口
EXPOSE 9200
EXPOSE 9300
CMD bin/elasticsearch
