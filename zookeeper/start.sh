#!/bin/bash
sudo docker run -d \
 --name=zk1 \
 --net=host \
 -e SERVER_ID=1 \
 -e ADDITIONAL_ZOOKEEPER_1=server.1=localhost:2888:3888 \
 -e ADDITIONAL_ZOOKEEPER_2=server.2=localhost:2889:3889 \
 -e ADDITIONAL_ZOOKEEPER_3=server.3=localhost:2890:3890 \
 -e ADDITIONAL_ZOOKEEPER_4=clientPort=2181 \
 garland/zookeeper

sudo docker run -d \
 --name=zk2 \
 --net=host \
 -e SERVER_ID=2 \
 -e ADDITIONAL_ZOOKEEPER_1=server.1=localhost:2888:3888 \
 -e ADDITIONAL_ZOOKEEPER_2=server.2=localhost:2889:3889 \
 -e ADDITIONAL_ZOOKEEPER_3=server.3=localhost:2890:3890 \
 -e ADDITIONAL_ZOOKEEPER_4=clientPort=2182 \
 garland/zookeeper

sudo docker run -d \
 --name=zk3 \
 --net=host \
 -e SERVER_ID=3 \
 -e ADDITIONAL_ZOOKEEPER_1=server.1=localhost:2888:3888 \
 -e ADDITIONAL_ZOOKEEPER_2=server.2=localhost:2889:3889 \
 -e ADDITIONAL_ZOOKEEPER_3=server.3=localhost:2890:3890 \
 -e ADDITIONAL_ZOOKEEPER_4=clientPort=2183 \
 garland/zookeeper
