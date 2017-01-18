FROM timeloveboy/moedocker
MAINTAINER timeloveboy(734991033@qq.com)
# 非交互式
RUN cd ~
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz --progress=bar:force 2>&1
RUN tar xzvf jdk-8u111-linux-x64.tar.gz 
RUN mv jdk1.8.0_111 /opt/jdk8
RUN rm jdk-8u111-linux-x64.tar.gz
ENV JAVA_HOME /opt/jdk8
ENV PATH $PATH:$JAVA_HOME/bin
RUN echo "export JAVA_HOME=/opt/jdk8" >>/etc/profile
RUN cat /etc/profile
RUN java -version

