FROM timeloveboy/jdk8
MAINTAINER timeloveboy(734991033@qq.com)
# HADOOP 安装
RUN wget http://mirrors.hust.edu.cn/apache/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz --progress=bar:force 2>&1
RUN tar xzvf hadoop-2.7.3.tar.gz
RUN mv hadoop-2.7.3 /opt/hadoop
RUN rm hadoop-2.7.3.tar.gz
ENV HADOOP_HOME /opt/hadoop
ENV PATH $PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
RUN hadoop version 
VOLUME $HADOOP_HOME/etc/hadoop
VOLUME $HADOOP_HOME/hdfs/
# SSH 免密登录
RUN mkdir -p ~/.ssh
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
# host
ADD hosts /etc/hosts
# 启动
RUN mkdir -p $HADOOP_HOME/hdfs/name
RUN mkdir -p $HADOOP_HOME/hdfs/data
EXPOSE 22
EXPOSE 9000
RUN hdfs namenode -format
WORKDIR $HADOOP_HOME/sbin
ADD starter-hadoop.sh starter-hadoop.sh
ENTRYPOINT sh starter-hadoop.sh

