FROM timeloveboy/jdk8
MAINTAINER timeloveboy(734991033@qq.com)
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.1.1.tar.gz  --progress=bar:force 2>&1
RUN tar xzvf elasticsearch-5.1.1.tar.gz
RUN mv elasticsearch-5.1.1 /opt/elasticsearch
RUN rm elasticsearch-5.1.1.tar.gz
ENV ES_HOME /opt/elasticsearch
ENV PATH $PATH:$ES_HOME/bin
VOLUME ["/elasticsearch/config"]
VOLUME ["/escluster"]
# 容器需要开放ES的9200和9300端口
EXPOSE 9200
EXPOSE 9300
RUN  elasticsearch -version
RUN cat ~/good.txt
RUN elasticsearch -d 
