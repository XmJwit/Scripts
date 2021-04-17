#!/bin/bash
newname="$1"
if [[ -z "$newname" ]];then
echo "bash $0 你的新主机名"
else
oldname="$(hostname)"
sed -i "s/$oldname$/$newname/g" /etc/hostname
sed -i "s/$oldname$/$newname/g" /etc/hosts
hostname $newname
fi