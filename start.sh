#!/bin/sh

set -e

cat <<EOF >/etc/resolv.conf
nameserver 8.8.8.8    # google DNS
nameserver 8.8.4.4
nameserver 1.1.1.1    # Cloudflare
nameserver 1.0.0.1
nameserver 4.2.2.2    # microsoft
nameserver 4.2.2.1
EOF

sed -i s/baidu.com/$DOMAIN/g /var/bind/pri/domain.zone
sed -i s/baidu.com/$DOMAIN/g /etc/bind/named.conf

echo -e $NS >> /var/bind/pri/domain.zone

chown -R root.root /etc/bind/rndc.key

/usr/sbin/named -f -g