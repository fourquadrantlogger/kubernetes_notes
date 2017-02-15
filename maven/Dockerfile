FROM timeloveboy/moedocker
MAINTAINER timeloveboy(734991033@qq.com)
# 非交互式
RUN cd ~
RUN wget http://mirrors.hust.edu.cn/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz --progress=bar:force 2>&1
RUN tar xzvf apache-maven-3.3.9-bin.tar.gz
RUN mv apache-maven-3.3.9-bin /opt/maven
RUN rm apache-maven-3.3.9-bin.tar.gz
RUN echo "export M2_HOME=/opt/maven" >>/etc/profile
RUN echo "export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/jdk8/bin:/opt/maven/bin" >>/etc/profile
ENV M2_HOME /opt/maven
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/jdk8/bin:/opt/maven/bin
RUN cat /etc/profile
RUN mvn -version

