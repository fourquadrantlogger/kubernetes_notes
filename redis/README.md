# redis

```
docker run --name moeredis -d redis
```

## redis-cli
```
docker run -it --link some-redis:redis --rm redis redis-cli -h redis -p 6379
```