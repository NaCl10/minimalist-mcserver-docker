FROM openjdk:8u212-jre-alpine

RUN apk update && apk upgrade

RUN addgroup -g 1000 minecraft \
  && adduser -Ss /bin/false -u 1000 -G minecraft -h /home/minecraft minecraft \
  && mkdir -m 777 /server \
  && chown minecraft:minecraft /server /home/minecraft

WORKDIR /

COPY init.sh /
RUN chmod +x /init.sh

ENTRYPOINT ["/init.sh"]
