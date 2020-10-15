FROM openjdk:8u212-jre-alpine

RUN apk update \ 
    && apk upgrade \
    && apk add screen \
    bash \
    util-linux

RUN mkdir -m 777 /server 

WORKDIR /

COPY init.sh /
RUN chmod +x /init.sh

ENTRYPOINT ["/init.sh"]
