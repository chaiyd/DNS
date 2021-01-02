FROM alpine

LABEL maintainer="chaiyd.cn@gmail.com"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add tzdata bind \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

ENV DOMAIN="baidu.com"
ENV NS="ns    A   192.168.1.1"

COPY named.conf /etc/bind/
COPY domain.zone /var/bind/pri/
COPY start.sh /

ENTRYPOINT ["/bin/sh","/start.sh"]
#CMD ["/usr/sbin/named", "-f", "-g"]
