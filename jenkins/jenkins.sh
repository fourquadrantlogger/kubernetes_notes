#!/usr/bin/env bash
docker rm -f my_jenkins
mkdir -p /data/jenkins
chown -R 1000 /var/jenkins
docker run -rm -p 8080:8080 \
-p 50000:50000 \
-v /data/jenkins:/var/jenkins_home  \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(which docker):/bin/docker \
--name my_jenkins \
-it timeloveboy/jenkins sh -c 'cat /var/jenkins_home/secrets/initialAdminPassword'
docker run -p 8080:8080 \
-p 50000:50000 \
-v /data/jenkins:/var/jenkins_home  \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(which docker):/bin/docker \
--restart=always \
--name my_jenkins \
-d timeloveboy/jenkins
docker ps -a
