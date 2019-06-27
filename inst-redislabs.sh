#!/bin/bash
mkdir redis-install
cd redis-install
wget https://s3.amazonaws.com/redis-enterprise-software-downloads/5.4.4/redislabs-5.4.4-7-bionic-amd64.tar
tar vxf redislabs-5.4.4-7-bionic-amd64.tar
sudo sed -i -e 's/#DNSStubListener=yes/DNSStubListener=no/g' /etc/systemd/resolved.conf
sudo mv /etc/resolv.conf /etc/resolv.conf.orig
sudo ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
sudo service systemd-resolved restart
sudo ./install.sh -y
