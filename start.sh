#!/bin/sh

set -e

echo "nameserver 223.5.5.5" >> /etc/resolv.conf
sed -i s/baidu.com/$DOMAIN/g /var/bind/pri/domain.zone
sed -i s/baidu.com/$DOMAIN/g /etc/bind/named.conf

echo -e $NS >> /var/bind/pri/domain.zone

chown -R named.named /var/bind/pri/domain.zone
/usr/sbin/named -f -g