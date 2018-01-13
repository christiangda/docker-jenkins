# Jenkins Docker Image

```
docker build -t christiangda/jenkins:latest .

docker build --no-cache --rm \
  --build-arg DOCKER_VERSION=17.12.0-ce \
  --tag christiangda/jenkins:lts \
  --tag christiangda/jenkins:latest .
```
