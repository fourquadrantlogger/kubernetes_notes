FROM timeloveboy/moedocker
MAINTAINER timeloveboy(734991033@qq.com)
# 非交互式
RUN cd ~
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz --progress=bar:force 2>&1
RUN tar xzvf jdk-8u111-linux-x64.tar.gz 
RUN mv jdk1.8.0_111 /opt/jdk8
RUN rm jdk-8u111-linux-x64.tar.gz
RUN echo "export JAVA_HOME=/opt/jdk8" >>/etc/profile
RUN echo "export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/jdk8/bin" >>/etc/profile
ENV JAVA_HOME /opt/jdk8
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/jdk8/bin
RUN cat /etc/profile
RUN cat ~/good.txt
RUN java -version

