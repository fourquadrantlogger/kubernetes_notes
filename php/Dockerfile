FROM timeloveboy/moedocker
RUN wget http://cn2.php.net/distributions/php-5.6.0.tar.gz   --progress=bar:force 2>&1
RUN tar xzvf php-5.6.0.tar.gz
RUN rm php-5.6.0.tar.gz

ADD libxml2-2.6.32.tar.gz .
RUN cd libxml2-2.6.32

RUN apt-get install -y mysql-client gcc make

RUN configure --prefix=/opt/libxml2
RUN make && make install

RUN ./configure --prefix=/opt/php   --enable-mbstring=all --with-libxml-dir=/opt/libxml2 --with-mysql=/usr/share/mysql

