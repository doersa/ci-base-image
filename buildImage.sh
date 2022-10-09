#!/bin/bash

# echo "构建镜像"
docker buildx build --platform linux/amd64,linux/arm64 --push -t doersa/ci-base-image:latest .
