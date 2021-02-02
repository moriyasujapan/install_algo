#!/bin/bash

pushd /root

if [ -d ./algo ]; then
  exit 0;
fi

#########################################
CA_PASS="xxxxxxxxxx"
#########################################

#install essentials
apt-get update -y
apt install -y --no-install-recommends python3-virtualenv


#download algo
git clone https://github.com/trailofbits/algo.git
cd algo

#initial setup
python3 -m virtualenv --python="$(command -v python3)" .env &&
  source .env/bin/activate &&
  python3 -m pip install -U pip virtualenv &&
  python3 -m pip install -r requirements.txt
  
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
echo " - senbao001" >> config.cfg.users
echo " - senbao002" >> config.cfg.users
echo " - senbao003" >> config.cfg.users
echo " - senbao004" >> config.cfg.users
echo " - senbao005" >> config.cfg.users
echo " - senbao006" >> config.cfg.users
echo " - senbao007" >> config.cfg.users
echo " - senbao008" >> config.cfg.users
echo " - senbao009" >> config.cfg.users
echo " - senbao010" >> config.cfg.users
echo " - qingdao001" >> config.cfg.users
echo " - qingdao002" >> config.cfg.users
echo " - qingdao003" >> config.cfg.users
echo " - qingdao004" >> config.cfg.users
echo " - qingdao005" >> config.cfg.users
echo " - qingdao006" >> config.cfg.users
echo " - qingdao007" >> config.cfg.users
echo " - qingdao008" >> config.cfg.users
echo " - qingdao009" >> config.cfg.users
echo " - qingdao010" >> config.cfg.users
echo " - hirakur001" >> config.cfg.users
echo " - hirakur002" >> config.cfg.users
echo " - hirakur003" >> config.cfg.users
echo " - xiefan001" >> config.cfg.users
echo " - xiefan002" >> config.cfg.users
echo " - xiefan003" >> config.cfg.users
echo " - golf001" >> config.cfg.users
echo " - golf002" >> config.cfg.users
echo " - golf003" >> config.cfg.users
echo " - golf004" >> config.cfg.users
echo " - golf005" >> config.cfg.users
echo " - golf006" >> config.cfg.users
echo " - golf007" >> config.cfg.users
echo " - golf008" >> config.cfg.users
echo " - golf009" >> config.cfg.users
echo " - golf010" >> config.cfg.users
echo " - guest001" >> config.cfg.users
echo " - guest002" >> config.cfg.users
echo " - guest003" >> config.cfg.users
echo " - guest004" >> config.cfg.users
echo " - guest005" >> config.cfg.users
echo " - guest006" >> config.cfg.users
echo " - guest007" >> config.cfg.users
echo " - guest008" >> config.cfg.users
echo " - guest009" >> config.cfg.users
echo " - guest010" >> config.cfg.users
echo " - guest011" >> config.cfg.users
echo " - guest012" >> config.cfg.users
echo " - guest013" >> config.cfg.users
echo " - guest014" >> config.cfg.users
echo " - guest015" >> config.cfg.users
echo " - guest016" >> config.cfg.users
echo " - guest017" >> config.cfg.users
echo " - guest018" >> config.cfg.users
echo " - guest019" >> config.cfg.users
echo " - guest020" >> config.cfg.users
echo " - guest021" >> config.cfg.users
echo " - guest022" >> config.cfg.users
echo " - guest023" >> config.cfg.users
echo " - guest024" >> config.cfg.users
echo " - guest025" >> config.cfg.users
echo " - guest026" >> config.cfg.users
echo " - guest027" >> config.cfg.users
echo " - guest028" >> config.cfg.users
echo " - guest029" >> config.cfg.users
echo " - guest030" >> config.cfg.users

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

pushd /var/www/html
ls -l configs/localhost/wireguard/*.png|awk '{print $9}'|awk -F. '{print $1}'|awk -F/ '{print $4}' > user_list
popd

popd
cp -R web/* /var/www/html/
echo "http://$global_ip_addr/configs/localhost"
