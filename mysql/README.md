# Docker 安装mysql

## https://hub.docker.com/_/mysql/

## 命令
```
sudo docker run --name moe-mysql -v /media/paidian/DATA/mysqldata:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql
```

## 连接mysql
```
sudo docker run -it --link moe-mysql:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'

```
