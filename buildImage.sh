#!/bin/bash

echo "提取构建镜像时需要的文件"
source_path="source"
mkdir -p $source_path/golang.org
mkdir -p $source_path/github.com
cp -rf $GOPATH/src/golang.org/x/lint $source_path/golang.org/
cp -rf $GOPATH/src/golang.org/x/tools $source_path/golang.org/
cp -rf $GOPATH/src/github.com/golang/lint $source_path/github.com

# echo "构建镜像"
docker build -t doersa/ci-base-image:latest .

echo "删除构建镜像时需要的文件"
rm -rf $source_path