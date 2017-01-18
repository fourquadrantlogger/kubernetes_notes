FROM timeloveboy/jdk8
MAINTAINER timeloveboy(734991033@qq.com)
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.1.2.tar.gz  --progress=bar:force 2>&1
RUN tar xzvf elasticsearch-5.1.2.tar.gz
RUN mv elasticsearch-5.1.2 /opt/elasticsearch
RUN rm elasticsearch-5.1.2.tar.gz
ENV ES_HOME /opt/elasticsearch
ENV PATH $PATH:$ES_HOME/bin
VOLUME ["/elasticsearch/config"]
VOLUME ["/escluster"]
# 新建用户
RUN adduser elasticsearch
RUN adduser elasticsearch sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# 容器需要开放ES的9200和9300端口
EXPOSE 9200
EXPOSE 9300
RUN  elasticsearch -version
RUN cat ~/good.txt
RUN chmod -R 777 /opt/elasticsearch
RUN su elasticsearch
WORKDIR /opt/elasticsearch
CMD bin/elasticsearch
