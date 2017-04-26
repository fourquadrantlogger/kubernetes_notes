# redis

阿里镜像
registry.cn-qingdao.aliyuncs.com/moeserverdemo/redis

```
docker run --name moeredis -d redis
```

## redis-cli
```
docker run -it --link some-redis:redis --rm redis redis-cli -h redis -p 6379
```