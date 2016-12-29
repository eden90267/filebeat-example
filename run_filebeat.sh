#!/bin/bash

docker rm -f fusion-filebeat
docker rm -f tomcat-filebeat
docker rm -f payara-filebeat

docker run --name fusion-filebeat -itd \
--restart=always \
-v /home/core/fusion-filebeat.yml:/filebeat.yml \
-v /home/fusion-ap/fusion-filebeat-registry:/etc/registry \
-v /home/fusion-ap:/srv/fusion-ap \
prima/filebeat:5.1.1

docker run --name tomcat-filebeat -itd \
--restart=always \
-v /home/core/tomcat-filebeat.yml:/filebeat.yml \
-v /home/fusion-ap/tomcat-filebeat-registry:/etc/registry \
-v /home/fusion-ap:/srv/fusion-ap \
prima/filebeat:5.1.1

docker run --name payara-filebeat -itd \
--restart=always \
-v /home/core/payara-filebeat.yml:/filebeat.yml \
-v /home/fusion-ap/payara-filebeat-registry:/etc/registry \
-v /home/fusion-ap:/srv/fusion-ap \
prima/filebeat:5.1.1