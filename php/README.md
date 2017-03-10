#php

php-src

php-/ext/mysql
php-/ext/pdo-mysql

opt/mysql

## build php
```
 ./configure --prefix=/usr/local/php5 --with-libxml-dir=/usr/local/libxml2  --with-config-file-path=/usr/local/php5/etc --with-mysql=/opt/mysql --enable-fpm
```

## build php-mysql

## build pdo-mysql