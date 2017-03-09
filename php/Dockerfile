FROM timeloveboy/moedocker
RUN wget http://cn2.php.net/get/php-5.6.30.tar.gz/from/this/mirror  --progress=bar:force 2>&1
RUN tar php-5.6.30.tar.gz
RUN rm php-5.6.30.tar.gz
RUN mv php-5.6.30 /opt/php-5.6