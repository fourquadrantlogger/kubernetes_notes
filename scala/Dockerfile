FROM timeloveboy/jdk8
MAINTAINER timeloveboy (734991033@qq.com)
# 下载
RUN wget http://downloads.lightbend.com/scala/2.12.1/scala-2.12.1.tgz --progress=bar:force 2>&1
RUN tar xzvf scala-2.12.1.tgz 
RUN rm scala-2.12.1.tgz 
RUN mv scala-2.12.1 /opt/scala
RUN echo  "export SCALA_HOME=/opt/scala" >>/etc/profile
ENV SCALA_HOME /opt/scala
ENV PATH $PATH:$SCALA_HOME/bin
RUN cat /etc/profile
RUN scala -version
