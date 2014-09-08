#!/bin/bash
echo "Installing chef rpm"
sudo rpm -Uvh /vagrant/private-chef-11.2.1-1.el6.x86_64.rpm
sudo service iptable stop
sudo hostname 'chefserver.intech.com'
echo "chefserver.intech.com" | sudo tee /etc/hostname
echo -e "127.0.0.2 `hostname` `hostname -s`" | sudo tee -a /etc/hosts
sudo service iptables stop
sudo private-chef-ctl reconfigure
