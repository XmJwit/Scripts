#!/bin/bash
loc=$(curl -s http://104.19.19.19/cdn-cgi/trace|grep loc|cut -d '=' -f 2)
if [ "${loc}" == "CN" ]; then
    # 如果是国内地区执行的命令
    echo "使用 阿里云 国内镜像源"
    bash <(curl -sL get.docker.com) --mirror Aliyun
else
    bash <(curl -sL get.docker.com)
fi
