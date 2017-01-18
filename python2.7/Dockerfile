FROM timeloveboy/moedocker
RUN apt-get update
RUN apt-get install -y gcc make --fix-missing
RUN wget https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tgz  --progress=bar:force 2>&1 
RUN tar xzvf Python-2.7.13.tgz
RUN rm -r Python-2.7.13.tgz
RUN mv Python-2.7.13 /opt/Python-2.7.13
WORKDIR  /opt/Python-2.7.13
RUN pwd
RUN ls
RUN ./configure
RUN make install
RUN ln -s /opt/Python-2.7.13/python /usr/bin/python
RUN python -V
