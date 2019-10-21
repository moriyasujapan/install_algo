#!/bin/bash

cd /root

#########################################
CA_PASS="xxxxxxxxxx"
#########################################

pushd algo

#install algo
source env/bin/activate
global_ip_addr=$(wget -q -O - http://ipecho.net/plain)
ansible-playbook main.yml -e "provider=local ondemand_cellular=false ondemand_wifi=false dns_adblocking=true ssh_tunneling=true windows=true store_pki=true server=localhost ca_password=${CA_PASS} endpoint=${global_ip_addr}"|tee install.log

#copy configs to www
rm -rf /var/www/html/configs
cp -R configs /var/www/html
chmod 755 -R /var/www/html/configs

pushd /var/www/html
ls -l configs/localhost/wireguard/*.png|awk '{print $9}'|awk -F. '{print $1}'|awk -F/ '{print $4}' > user_list
popd

echo "http://$global_ip_addr/configs/localhost"

