# redis

阿里镜像
registry.cn-qingdao.aliyuncs.com/moeserverdemo/redis


https://hub.docker.com/r/library/redis/

```
docker run \
--name moeredis \
-v /CODE/github.com/timeloveboy/docker_notes/redis/redis.conf:/etc/redis.conf \
-d redis sh -c 'redis-server /etc/redis.conf'
```

## redis-cli
```
docker run -it --link moeredis:redis --rm redis redis-cli -h redis -p 6379
```