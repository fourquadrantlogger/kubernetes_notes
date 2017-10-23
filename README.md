# docker_notes

## ubuntu 
```
timeloveboy@timeloveboy-os:~$ curl -sSL https://get.docker.com/ | sudo sh
 
timeloveboy@timeloveboy-os:~$ sudo docker version

Client:
 Version:      1.11.2
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   b9f10c9
 Built:        Wed Jun  1 21:47:50 2016
 OS/Arch:      linux/amd64

Server:
 Version:      1.11.2
 API version:  1.23
 Go version:   go1.5.4
 Git commit:   b9f10c9
 Built:        Wed Jun  1 21:47:50 2016
 OS/Arch:      linux/amd64


```

## docker镜像

从dockerhub中获取容器
```
镜像都是按照用户名/镜像名的方式来存储的
docker pull learn/tutorial
```

## docker阿里云安装脚本
```
curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sh -
sudo service docker start
```

## 删除容器

```
sudo docker rm -f  `sudo docker ps -a -q`
```

## 删除空镜像
```
sudo docker rmi -f `sudo docker images | awk '/^<none>/ { print $3 }'`
```

```
sudo docker images|grep none | awk ' { print $3 }'
```
## Docker 参数
+ --link
在使用Docker的时候我们会常常碰到这么一种应用，就是我需要两个或多个容器，其中某些容器需要使用另外一些容器提供的服务。比如这么一种情况：我们需要一个容器来提供MySQL的数据库服务，而另外两个容器作为客户端来连接使用mysql数据库服务。

+ --it
+ --name


## Docker log


docker logs -f my-container-name

## docker inspect 