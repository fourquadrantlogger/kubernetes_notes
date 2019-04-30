FROM ubuntu:latest
MAINTAINER timeloveboy(734991033@qq.com)
RUN apt-get update &&\
    apt-get install -y --fix-missing git-core sudo net-tools iproute2  vim wget curl openssh-server iputils-ping  &&\
    apt-get clean all
COPY good.txt /root/good.txt
ADD install.sh /root/install.sh
RUN /root/install.sh
EXPOSE 22
