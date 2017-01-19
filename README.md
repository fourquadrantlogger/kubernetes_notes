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