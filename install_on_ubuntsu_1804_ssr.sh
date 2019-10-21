#!/bin/bash

wget https://github.com/teddysun/across/raw/master/bbr.sh -O bbr.sh
wget https://github.com/teddysun/shadowsocks_install/raw/master/shadowsocksR.sh -O shadowsocksR.sh
chmod +x *.sh

./bbr.sh
./shadowsocksR.sh
