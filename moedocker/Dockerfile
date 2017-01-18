FROM ubuntu:latest
MAINTAINER timeloveboy(734991033@qq.com)

RUN cat /etc/issue
RUN apt-get update
RUN apt-get install -y iputils-ping net-tools iproute2  vim openssh-server wget curl
RUN cd ~
ADD good.txt good.txt
EXPOSE 22
