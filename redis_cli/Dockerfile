FROM timeloveboy/moedocker

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update &&\
    apt-get -y install redis-tools &&\
    apt-get clean

ENTRYPOINT ["/usr/bin/redis-cli"]