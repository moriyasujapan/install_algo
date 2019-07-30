#!/bin/bash

cd /root

if [ -d ./algo ]; then
  exit 0;
fi

#########################################
CA_PASS="xxxxxxxxxx"
#########################################

#install essentials
apt-get update -y
apt-get install \
 build-essential \
 libssl-dev \
 libffi-dev \
 python-dev \
 python-pip \
 python-setuptools \
 python-virtualenv -y

#download algo
git clone https://github.com/trailofbits/algo.git
cd algo

#initial setup
python -m virtualenv --python=`which python2` env && source env/bin/activate && python -m pip install -U pip && python -m pip install -r requirements.txt

#create config
config_lines=$(wc -l config.cfg | awk '{print $1}')
tail_lines=$(($config_lines-11))
tail -$tail_lines config.cfg > config.cfg.base

echo "---" >> config.cfg.users
echo "# This is the list of users to generate." >> config.cfg.users
echo "# Every device must have a unique username." >> config.cfg.users
echo "# You can generate up to 250 users at one time." >> config.cfg.users
echo "# Usernames with leading 0's or containing only numbers should be escaped in double quotes, e.g. "000dan" or "123"." >> config.cfg.users
echo "users:" >> config.cfg.users >> config.cfg.users
# add users this line
# echo "  - jane.doe" >> config.cfg.users
echo "" >> config.cfg.users

cat config.cfg.users config.cfg.base > config.cfg

#install algo
source env/bin/activate
global_ip_addr=$(wget -q -O - http://ipecho.net/plain)
ansible-playbook main.yml -e "provider=local ondemand_cellular=false ondemand_wifi=false dns_adblocking=true ssh_tunneling=true windows=true store_pki=true server=localhost ca_password=${CA_PASS} endpoint=${global_ip_addr}"|tee install.log

################################# algo vpn installed ##################################

#installing nginx
apt-get -y install nginx
iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -I INPUT -p tcp -m tcp --dport 443 -j ACCEPT

cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
sed -i -e 's/http {/http {\n\n        autoindex on;\n        autoindex_exact_size off;\n        autoindex_localtime on;\n/g' /etc/nginx/nginx.conf
/etc/init.d/nginx restart

#copy configs to www
rm -rf /var/www/html/configs
cp -R configs /var/www/html
chmod 755 -R /var/www/html/configs

echo "http://$global_ip_addr/configs/localhost"

