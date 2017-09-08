FROM timeloveboy/jdk8
MAINTAINER timeloveboy(734991033@qq.com)

ADD install.sh install.sh
RUN sh install.sh
ENV GRADLE /opt/gradle
ENV PATH $PATH:$GRADLE/bin
