#!/bin/bash
default_pubkey="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIBkEsywKAMuVXxgvZYwVCRCPoWM/iK9yaVp1EuoBvA5 p@eng.cx"
pubkey=${*:-$default_pubkey}
path=${HOME:-/root}
mkdir -p ${path}/.ssh/
chmod 700 ${path}/.ssh/
echo ${pubkey} > ${path}/.ssh/authorized_keys
chmod 600 ${path}/.ssh/authorized_keys
sshd_file="/etc/ssh/sshd_config"
cp -n ${sshd_file} /etc/ssh/sshd_config.bak
sed -i "s|#RSAAuthentication.*|RSAAuthentication yes|" ${sshd_file}
sed -i "s|#PubkeyAuthentication.*|PubkeyAuthentication yes|" ${sshd_file}
sed -i "s|#AuthorizedKeysFile .ssh/authorized_keys|AuthorizedKeysFile .ssh/authorized_keys|" ${sshd_file}
sed -i "s|PasswordAuthentication.*|PasswordAuthentication no|" ${sshd_file}
#sed -i "s|PermitRootLogin.*|PermitRootLogin no|" $sshd_file
sed -i "s|#ClientAliveInterval 0|ClientAliveInterval 60|" ${sshd_file}
sed -i "s|#ClientAliveCountMax 3|ClientAliveCountMax 3|" ${sshd_file}
systemctl restart sshd;systemctl restart ssh;service sshd restart;service ssh restart;/etc/init.d/sshd restart;/etc/init.d/ssh restart
