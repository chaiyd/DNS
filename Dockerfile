FROM alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

RUN apk add bind
COPY named.conf /etc/bind/
COPY xxx.com.zone /var/bind/pri/
COPY docker-entrypoint.sh /

ENTRYPOINT ["/bin/sh","/docker-entrypoint.sh"]
#CMD ["/usr/sbin/named", "-f", "-g"]
