FROM timeloveboy/jdk8
MAINTAINER timeloveboy(734991033@qq.com)
FROM jenkins

USER root

#更新源并安装缺少的包
RUN apt-get update && apt-get install -y libltdl7 && apt-get update

ARG dockerGid=999

RUN echo "docker:x:${dockerGid}:jenkins" >> /etc/group

# 安装 docker-compose 因为等下构建环境的需要
RUN curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

RUN chmod +x /usr/local/bin/docker-compose