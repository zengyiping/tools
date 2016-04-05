#!/bin/sh
sudo apt-get install pptpd
sudo echo localip 192.168.0.1 >> /etc/pptpd.conf
sudo echo remoteip 192.168.0.100-110 >> /etc/pptpd.conf
sudo echo ms-dns 8.8.8.8 >> /etc/ppp/pptpd-options
sudo echo ms-dns 4.4.4.4 >> /etc/ppp/pptpd-options
sudo echo  "yourname * yourpasswd * " >> /etc/ppp/chap-secrets
sudo service pptpd restart
sudo echo net.ipv4.ip_forward=1 >> /etc/sysctl.conf
sudo sysctl -p
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo echo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE >> /etc/rc.local
