FROM timeloveboy/scala
MAINTAINER timeloveboy(734991033@qq.com)
RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz  --progress=bar:force 2>&1
RUN tar xzvf spark-2.1.0-bin-hadoop2.7.tgz
RUN rm spark-2.1.0-bin-hadoop2.7.tgz
RUN mv spark-2.1.0-bin-hadoop2.7 /opt/spark
ENV SPARK_HOME /opt/spark
