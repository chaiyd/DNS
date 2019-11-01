#!/bin/bash

echo "nameserver 223.5.5.5" >> /etc/resolv.conf
chown -R named.named /var/bind/pri/baidu.com.zone
/usr/sbin/named -f -g