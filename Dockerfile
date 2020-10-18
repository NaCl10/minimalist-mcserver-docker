FROM openjdk:8u212-jre-alpine

RUN apk update \ 
    && apk upgrade

RUN apk add \
    screen \
    dumb-init \
    bash \
    util-linux

RUN mkdir -m 777 /server 

WORKDIR /

COPY init.sh /
RUN chmod +x /init.sh

ENTRYPOINT ["dumb-init", "--", "/init.sh"]
