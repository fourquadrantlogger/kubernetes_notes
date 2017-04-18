FROM ubuntu:latest
MAINTAINER timeloveboy(734991033@qq.com)

RUN apt-get update &&\
    apt-get install -y sudo net-tools iproute2  vim wget curl openssh-server iputils-ping
COPY good.txt /root/good.txt
RUN ls -l /root
EXPOSE 22
