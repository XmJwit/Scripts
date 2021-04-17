#!/bin/bash
if [[ -z "$(command -v docker)" ]];then
    echo "没有安装Docker,即将退出。
    如需安装可以运行命令：[ curl -fsSL https://get.docker.com | bash --mirror Aliyun ]安装"
else
    read -p "输入端口(默认8080):" port
    [[ -z "${port}" ]] && port=8080
    docker run -dit --restart always -p ${port}:80 -it badapple9/speedtest-x && \
    ip=$(curl -s https://ipinfo.io/ip)
	[[ -z $ip ]] && ip=$(curl -s http://ipv4.ip.sb)
	[[ -z $ip ]] && ip=$(curl -s https://api.ipify.org)
	[[ -z $ip ]] && ip=$(curl -s https://ip.seeip.org)
	[[ -z $ip ]] && ip=$(curl -s https://ifconfig.co/ip)
	[[ -z $ip ]] && ip=$(curl -s https://api.myip.com | grep -oE "([0-9]{1,3}\.){3}[0-9]{1,3}")
	[[ -z $ip ]] && ip=$(curl -s icanhazip.com)
	[[ -z $ip ]] && ip=$(curl -s myip.ipip.net | grep -oE "([0-9]{1,3}\.){3}[0-9]{1,3}")
	[[ -z $ip ]] && ip="你的ip"
    if [[ "${ip}" ]];then
        echo "可以访问 http://${ip}:${port} 看看"
    fi
fi
