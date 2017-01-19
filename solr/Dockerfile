FROM timeloveboy/jdk8
MAINTAINER timeloveboy(734991033@qq.com)
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/lucene/solr/6.3.0/solr-6.3.0.tgz --progress=bar:force 2>&1
RUN tar xzvf solr-6.3.0.tgz
RUN rm solr-6.3.0.tgz
RUN mv solr-6.3.0 /opt/solr
