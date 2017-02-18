FROM alpine:edge
MAINTAINER daewood <daewood@qq.com>

RUN \
echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
apk --update add mongodb && \
mkdir -p /data/db && chown mongodb:mongodb /data/db && \
rm /usr/bin/mongosniff /usr/bin/mongoperf && \
rm -rf /var/cache/apk/* /src

VOLUME [ "/data/db" ]
EXPOSE 27017 28017

COPY run.sh /root
ENTRYPOINT [ "/root/run.sh" ]
CMD [ "mongod" ]
