#!/bin/bash
if [[ "$(command -v sudo)" ]];then
    sudo=sudo
fi
curl https://rclone.org/install.sh | ${sudo} bash