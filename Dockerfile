# Base image: https://hub.docker.com/_/golang/
FROM golang:latest
USER root

ENV GOPROXY=https://goproxy.cn,direct GO111MODULE=on

# install docker
RUN curl -O https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz \
    && tar zxvf docker-latest.tgz \
    && cp docker/docker /usr/local/bin/ \
    && rm -rf docker docker-latest.tgz

# install expect
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    echo "deb http://mirrors.aliyun.com/debian stretch main contrib non-free" > /etc/apt/sources.list \
    echo "deb http://mirrors.aliyun.com/debian stretch-updates main contrib non-free" >> /etc/apt/sources.list \
    echo "deb http://mirrors.aliyun.com/debian-security stretch/updates main contrib non-free" >> /etc/apt/sources.list 
RUN apt-get update \
    && apt-get install -y tcl tk expect 