# Base image: https://hub.docker.com/_/golang/
FROM golang:1.18.7
USER root

ENV GOPROXY=https://goproxy.cn,direct GO111MODULE=on

# install docker
RUN curl -fsSL https://get.docker.com -o get-docker.sh \
    && sh ./get-docker.sh
    
# install expect and make
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free" > /etc/apt/sources.list \
    echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free" >> /etc/apt/sources.list \
    echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free" >> /etc/apt/sources.list \
    echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free" >> /etc/apt/sources.list 
RUN apt-get update \
    && apt-get install -y tcl tk expect make

# install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod a+x kubectl && mv kubectl /usr/bin