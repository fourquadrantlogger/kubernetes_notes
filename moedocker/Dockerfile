FROM ubuntu:latest
MAINTAINER timeloveboy(734991033@qq.com)

RUN cat /etc/issue
RUN apt-get update
RUN apt-get install -y sudo 
RUN apt-get install -y net-tools 
RUN apt-get install -y iproute2  
RUN apt-get install -y vim
RUN apt-get install -y  wget curl
RUN apt-get install -y openssh-server
RUN apt-get install -y  iputils-ping
COPY good.txt /root/good.txt
RUN ls -l /root
EXPOSE 22
