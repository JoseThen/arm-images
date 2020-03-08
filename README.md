# arm-images
---

_ARM flavored Docker images._

These images will be centered around use with my RPI cluster.


These images are meant to be created and pushed with the following commands:

```
docker buildx create --name armbuilder
docker buildx use armbuilder

VERSION=v1.9.3
docker buildx build \
--build-arg VERSION=${VERSION} \
--platform linux/arm/v7,linux/amd64 \
--progress plain \
--push -t JoseThen/kube-state-metrics:${VERSION} .
```
