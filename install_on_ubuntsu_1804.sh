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

apt install -y python3-pip
pip install pyOpenSSL --upgrade

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
echo " - guest031" >> config.cfg.users
echo " - guest032" >> config.cfg.users
echo " - guest033" >> config.cfg.users
echo " - guest034" >> config.cfg.users
echo " - guest035" >> config.cfg.users
echo " - guest036" >> config.cfg.users
echo " - guest037" >> config.cfg.users
echo " - guest038" >> config.cfg.users
echo " - guest039" >> config.cfg.users
echo " - guest040" >> config.cfg.users
echo " - guest041" >> config.cfg.users
echo " - guest042" >> config.cfg.users
echo " - guest043" >> config.cfg.users
echo " - guest044" >> config.cfg.users
echo " - guest045" >> config.cfg.users
echo " - guest046" >> config.cfg.users
echo " - guest047" >> config.cfg.users
echo " - guest048" >> config.cfg.users
echo " - guest049" >> config.cfg.users
echo " - guest050" >> config.cfg.users
echo " - guest051" >> config.cfg.users
echo " - guest052" >> config.cfg.users
echo " - guest053" >> config.cfg.users
echo " - guest054" >> config.cfg.users
echo " - guest055" >> config.cfg.users
echo " - guest056" >> config.cfg.users
echo " - guest057" >> config.cfg.users
echo " - guest058" >> config.cfg.users
echo " - guest059" >> config.cfg.users
echo " - guest060" >> config.cfg.users
echo " - guest061" >> config.cfg.users
echo " - guest062" >> config.cfg.users
echo " - guest063" >> config.cfg.users
echo " - guest064" >> config.cfg.users
echo " - guest065" >> config.cfg.users
echo " - guest066" >> config.cfg.users
echo " - guest067" >> config.cfg.users
echo " - guest068" >> config.cfg.users
echo " - guest069" >> config.cfg.users
echo " - guest070" >> config.cfg.users
echo " - guest071" >> config.cfg.users
echo " - guest072" >> config.cfg.users
echo " - guest073" >> config.cfg.users
echo " - guest074" >> config.cfg.users
echo " - guest075" >> config.cfg.users
echo " - guest076" >> config.cfg.users
echo " - guest077" >> config.cfg.users
echo " - guest078" >> config.cfg.users
echo " - guest079" >> config.cfg.users
echo " - guest080" >> config.cfg.users
echo " - guest081" >> config.cfg.users
echo " - guest082" >> config.cfg.users
echo " - guest083" >> config.cfg.users
echo " - guest084" >> config.cfg.users
echo " - guest085" >> config.cfg.users
echo " - guest086" >> config.cfg.users
echo " - guest087" >> config.cfg.users
echo " - guest088" >> config.cfg.users
echo " - guest089" >> config.cfg.users
echo " - guest090" >> config.cfg.users
echo " - guest091" >> config.cfg.users
echo " - guest092" >> config.cfg.users
echo " - guest093" >> config.cfg.users
echo " - guest094" >> config.cfg.users
echo " - guest095" >> config.cfg.users
echo " - guest096" >> config.cfg.users
echo " - guest097" >> config.cfg.users
echo " - guest098" >> config.cfg.users
echo " - guest099" >> config.cfg.users
echo " - guest100" >> config.cfg.users
echo " - guest101" >> config.cfg.users
echo " - guest102" >> config.cfg.users
echo " - guest103" >> config.cfg.users
echo " - guest104" >> config.cfg.users
echo " - guest105" >> config.cfg.users
echo " - guest106" >> config.cfg.users
echo " - guest107" >> config.cfg.users
echo " - guest108" >> config.cfg.users
echo " - guest109" >> config.cfg.users
echo " - guest110" >> config.cfg.users
echo " - guest111" >> config.cfg.users
echo " - guest112" >> config.cfg.users
echo " - guest113" >> config.cfg.users
echo " - guest114" >> config.cfg.users
echo " - guest115" >> config.cfg.users
echo " - guest116" >> config.cfg.users
echo " - guest117" >> config.cfg.users
echo " - guest118" >> config.cfg.users
echo " - guest119" >> config.cfg.users
echo " - guest120" >> config.cfg.users
echo " - guest121" >> config.cfg.users
echo " - guest122" >> config.cfg.users
echo " - guest123" >> config.cfg.users
echo " - guest124" >> config.cfg.users
echo " - guest125" >> config.cfg.users
echo " - guest126" >> config.cfg.users
echo " - guest127" >> config.cfg.users
echo " - guest128" >> config.cfg.users
echo " - guest129" >> config.cfg.users
echo " - guest130" >> config.cfg.users
echo " - guest131" >> config.cfg.users
echo " - guest132" >> config.cfg.users
echo " - guest133" >> config.cfg.users
echo " - guest134" >> config.cfg.users
echo " - guest135" >> config.cfg.users
echo " - guest136" >> config.cfg.users
echo " - guest137" >> config.cfg.users
echo " - guest138" >> config.cfg.users
echo " - guest139" >> config.cfg.users
echo " - guest140" >> config.cfg.users
echo " - guest141" >> config.cfg.users
echo " - guest142" >> config.cfg.users
echo " - guest143" >> config.cfg.users
echo " - guest144" >> config.cfg.users
echo " - guest145" >> config.cfg.users
echo " - guest146" >> config.cfg.users
echo " - guest147" >> config.cfg.users
echo " - guest148" >> config.cfg.users
echo " - guest149" >> config.cfg.users
echo " - guest150" >> config.cfg.users
echo " - guest151" >> config.cfg.users
echo " - guest152" >> config.cfg.users
echo " - guest153" >> config.cfg.users
echo " - guest154" >> config.cfg.users
echo " - guest155" >> config.cfg.users
echo " - guest156" >> config.cfg.users
echo " - guest157" >> config.cfg.users
echo " - guest158" >> config.cfg.users
echo " - guest159" >> config.cfg.users
echo " - guest160" >> config.cfg.users
echo " - guest161" >> config.cfg.users
echo " - guest162" >> config.cfg.users
echo " - guest163" >> config.cfg.users
echo " - guest164" >> config.cfg.users
echo " - guest165" >> config.cfg.users
echo " - guest166" >> config.cfg.users
echo " - guest167" >> config.cfg.users
echo " - guest168" >> config.cfg.users
echo " - guest169" >> config.cfg.users
echo " - guest170" >> config.cfg.users
echo " - guest171" >> config.cfg.users
echo " - guest172" >> config.cfg.users
echo " - guest173" >> config.cfg.users
echo " - guest174" >> config.cfg.users
echo " - guest175" >> config.cfg.users
echo " - guest176" >> config.cfg.users
echo " - guest177" >> config.cfg.users
echo " - guest178" >> config.cfg.users
echo " - guest179" >> config.cfg.users
echo " - guest180" >> config.cfg.users
echo " - guest181" >> config.cfg.users
echo " - guest182" >> config.cfg.users
echo " - guest183" >> config.cfg.users
echo " - guest184" >> config.cfg.users
echo " - guest185" >> config.cfg.users
echo " - guest186" >> config.cfg.users
echo " - guest187" >> config.cfg.users
echo " - guest188" >> config.cfg.users
echo " - guest189" >> config.cfg.users
echo " - guest190" >> config.cfg.users
echo " - guest191" >> config.cfg.users
echo " - guest192" >> config.cfg.users
echo " - guest193" >> config.cfg.users
echo " - guest194" >> config.cfg.users
echo " - guest195" >> config.cfg.users
echo " - guest196" >> config.cfg.users
echo " - guest197" >> config.cfg.users
echo " - guest198" >> config.cfg.users
echo " - guest199" >> config.cfg.users
echo " - guest200" >> config.cfg.users

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

